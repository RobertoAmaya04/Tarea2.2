import 'package:flutter/material.dart';
import 'package:todoapp/src/widgets/password_widget.dart';
import 'package:todoapp/src/widgets/simple_text_input.dart';

enum CustomTextInputType { email, password, title, description, simpleInput }

class CustomTextInput extends StatelessWidget {
  final CustomTextInputType type;
  final TextEditingController cont;

  CustomTextInput({required this.type, required this.cont});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CustomTextInputType.email:
        return SimpleInput(
          cont: cont,
          suffixIcon: Icon(Icons.email),
          keyboard: TextInputType.emailAddress,
          label: "e-mail",
          lines: 1,
          hint: "sunombre@unah.hn",
        );
      case CustomTextInputType.password:
        return PasswordText(cont: cont);
      case CustomTextInputType.title:
        return SimpleInput(
          cont: cont,
          prefixIcon: Icon(Icons.title),
          keyboard: TextInputType.text,
          label: "titulo",
          lines: 1,
          hint: "Escriba un titulo",
        );
      case CustomTextInputType.description:
        return SimpleInput(
          cont: cont,
          keyboard: TextInputType.text,
          label: "Descripcion",
          lines: 5,
        );
      case CustomTextInputType.simpleInput:
        return SimpleInput(cont: cont, keyboard: TextInputType.text, lines: 1);
    }
  }
}
