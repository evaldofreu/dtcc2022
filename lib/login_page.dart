import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_field.dart';

import 'usuario_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _inputField("Email", Icons.email, false),
              _inputField("Senha", Icons.password, true),
              SizedBox(
                height: 20,
              ),
              _botaoEntrar(),
              _botaoCadastar(),

            ],
          ),
        ),
      ),
    );
  }

  _inputField(String rotulo, IconData icone, bool senha) {
    return InputField(rotulo, icone, senha);
  }

  _botaoEntrar() {
    return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: () {}, 
                                          child: Text("Entrar"))),
                ],
              );
  }

  _botaoCadastar() {
    return Padding(
      padding: const EdgeInsets.only(top:12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                        Text("Não tem um conta.    ",style:GoogleFonts.dekko()),
                        TextButton(onPressed: (){

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsuarioPage()));


                        }, child: Text("Cadastre-se"))
                  ]
        ),
    );
  }
}
