import 'package:dtcc2022/input_field.dart';
import 'package:flutter/material.dart';
class UsuarioForm extends StatefulWidget {
  const UsuarioForm({Key? key}) : super(key: key);

  @override
  State<UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String senha = "";
    return SingleChildScrollView(child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        child: Column(
          children: [
             InputField("Nome", Icons.autofps_select_sharp, false,validator: (value) {
               if (value!.isEmpty) {
                 return "Campo não pode ficar vazio";
               }
             },),
             InputField("Email", Icons.mail, false, validator: (value) {
               if (value!.isEmpty || !value.contains('@')) {
                 return "Informe um email válido";
               }
             },),
             InputField("Senha", Icons.password, true, validator: (value){
               if (value!.isEmpty || value.length<3) {
                 return "A senha deve ter ao menos 3 caracteres";
              } else {
                senha = value;
              }
             }
             ,),
             InputField("Confirmação", Icons.add_to_photos_outlined, true,validator: (value){
                if (value!=senha) {
                  return "Confirmação de senha deve ser igual a senha";
                }
             },),
             Row(children: [Expanded(child: ElevatedButton.icon(onPressed: (){
               if (_key.currentState!.validate()) {
                 _key.currentState!.save();

               }
               

             }, icon: Icon(Icons.save), label: Text("Salvar")))])
          ],
        ),
      ),
    ));
  }
}