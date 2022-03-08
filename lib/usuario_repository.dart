import 'package:cloud_firestore/cloud_firestore.dart';

import 'usuario_model.dart';

class UsuarioRepository {
  Future<void> salvar(UsuarioModel usuario) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var col = firestore.collection("usuarios");
    var doc = await col.doc(usuario.id).get();
    if (doc.exists)
      return await col.doc(usuario.id).update(usuario.toJson());
    else
      return await col.doc(usuario.id).set(usuario.toJson());
  }
}
