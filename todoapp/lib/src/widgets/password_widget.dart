import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  final TextEditingController cont;
  const PasswordText({super.key, required this.cont});

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.cont,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide()),
        labelStyle: const TextStyle(fontSize: 12),
        alignLabelWithHint: false,
        label: const Text("contraseña"),

        suffixIcon: IconButton(
          icon: Icon(
            visibility
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () {
            visibility = !visibility;
            setState(() {});
          },
        ),
      ),
      obscureText: visibility,
    );
  }
}
