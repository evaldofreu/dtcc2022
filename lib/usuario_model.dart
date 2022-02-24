class UsuarioModel {
  String? id;
  String? nome;
  String? email;
  String? senha;

  UsuarioModel({this.id, this.nome, this.email, this.senha});

  Map<String, dynamic> toJson() {
    return {"nome":nome,"email":email};
  }
}
