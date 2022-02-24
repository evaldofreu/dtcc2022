import 'package:dtcc2022/input_field.dart';
import 'package:dtcc2022/usuario_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'usuario_model.dart';

class UsuarioForm extends StatefulWidget {
  final UsuarioModel? usuario;
  const UsuarioForm({this.usuario, Key? key}) : super(key: key);

  @override
  State<UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  UsuarioModel  usuario = UsuarioModel();

@override
void initState() {
  super.initState();
  if (widget.usuario!=null) {
      usuario = widget.usuario!;
  }
}
  

  @override
  Widget build(BuildContext context) {
    String senha = "";
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
            InputField(
              "Nome",
              Icons.autofps_select_sharp,
              false,
              initialValue: usuario.nome,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode ficar vazio";
                }
              },
              onsaved: (value) {
                usuario.nome = value;
              },
            ),
            InputField(
              "Email",
              Icons.mail,
              false,
              initialValue: usuario.email,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return "Informe um email válido";
                }
              },
              onsaved: (value) {
                usuario.email = value;
              },
            ),
            InputField(
              "Senha",
              Icons.password,
              true,
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return "A senha deve ter ao menos 3 caracteres";
                } else {
                  senha = value;
                }
              },
              onsaved: (value) {
                usuario.senha = senha;
              },
            ),
            InputField(
              "Confirmação",
              Icons.add_to_photos_outlined,
              true,
              validator: (value) {
                if (value != senha) {
                  return "Confirmação de senha deve ser igual a senha";
                }
              },
            ),
            Row(children: [
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          salvar(usuario);
                        }
                      },
                      icon: Icon(Icons.save),
                      label: Text("Salvar")))
            ])
          ],
        ),
      ),
    ));
  }

  salvar(UsuarioModel usuario) async {
    try {
      if (usuario.id==null) {//se for usuario novo
         UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: usuario.email!, password: usuario.senha!);
         usuario.id =  userCredential.user!.uid;              
      }
      UsuarioRepository().salvar(usuario);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha informada é muito fácil.');
      } else if (e.code == 'email-already-in-use') {
        print('Email já foi utilizado por outra conta.');
      }
    } catch (e) {
      print(e);
    }
  }
}
