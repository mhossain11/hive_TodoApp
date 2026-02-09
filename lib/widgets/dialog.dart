
import 'package:flutter/material.dart';

class InputDialog extends StatelessWidget{
   InputDialog({
     super.key,
     required this.controller,
     required this.onTab,
    required this.btnTitle
   });
  TextEditingController controller;
  VoidCallback onTab;
  String btnTitle;

  @override
  Widget build(BuildContext context) {

   return AlertDialog(
     content: TextField(
       controller: controller,
       decoration: InputDecoration(
         helperText: "Type Something"
       ),
     ),
     actions: [
       TextButton(onPressed: (){
         Navigator.pop(context);
         controller.clear();
       }, child: Text("Cancel")),
       ElevatedButton(onPressed: onTab, child: Text(btnTitle))
     ],
   );
  }
}