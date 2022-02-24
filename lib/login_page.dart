import 'package:dtcc2022/usuario_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_widget.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UsuarioModel? usuario;

  autenticacao() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Usuário fez logout!');
        setState(() {
          usuario = null;
        });
      } else {
        print('Usuario fez SigIn!');
        setState(() {
          usuario = UsuarioModel(
              id: user.uid, nome: user.displayName, email: user.email);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    autenticacao();
  }

  @override
  Widget build(BuildContext context) {
    return usuario == null ? LoginWidget() : MainPage(usuario);
      
  }
}
