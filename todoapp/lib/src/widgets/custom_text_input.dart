import 'package:flutter/material.dart';

enum CustomTextInputType { email, password, title, description }

class CustomTextInput extends StatelessWidget {
  final CustomTextInputType type;
  final TextEditingController cont;

  CustomTextInput({required this.type, required this.cont});

  @override
  Widget build(BuildContext context) {
    final Icon icon;
    final String label;
    final TextInputType keyboard;
    final int lines;

    switch (type) {
      case CustomTextInputType.email:
        icon = Icon(Icons.email);
        label = 'Correo';
        keyboard = TextInputType.emailAddress;
        lines = 1;
        break;
      case CustomTextInputType.password:
        icon = Icon(Icons.visibility);
        label = 'Contrasena';
        keyboard = TextInputType.visiblePassword;
        lines = 1;
        break;
      case CustomTextInputType.title:
        icon = Icon(Icons.title);
        label = 'Titulo';
        keyboard = TextInputType.text;
        lines = 1;
        break;
      case CustomTextInputType.description:
        icon = Icon(Icons.description);
        label = 'Descripcion';
        keyboard = TextInputType.text;
        lines = 5;
        break;
    }

    return TextField(controller: cont, keyboardType: keyboard, maxLines: lines);
  }
}
