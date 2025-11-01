import 'package:flutter/material.dart';

class SimpleInput extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? label;
  final TextInputType keyboard;
  final int lines;
  final TextEditingController cont;
  final String? hint;
  SimpleInput({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.keyboard = TextInputType.text,
    this.lines = 1,
    required this.cont,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      controller: cont,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide()),
        labelStyle: const TextStyle(fontSize: 12),
        alignLabelWithHint: true,
        hint: hint == null ? Text("") : Text(hint!),
        label: label != null ? Text(label!) : null,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      maxLines: lines,
    );
  }
}
