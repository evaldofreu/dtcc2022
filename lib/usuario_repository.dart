import 'package:cloud_firestore/cloud_firestore.dart';


import 'usuario_model.dart';

class UsuarioRepository {

  Future<void> salvar(UsuarioModel usuario) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var col = firestore.collection("usuarios");
    return await col.doc(usuario.id).set(usuario.toJson());
  }

}