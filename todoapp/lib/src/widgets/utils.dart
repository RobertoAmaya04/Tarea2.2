import 'package:flutter/material.dart';

class Utils {
  //final List<User> users = [amehd, roberto];

  static String obtenerIniciales(String str) {
    final strArr = str.split(' ');
    String strReturn = ' ';
    for (int i = 0; i < strArr.length; i++)
      strReturn = strReturn + strArr[i][0];
    return strReturn;
  }

  static bool emailValidator(String correo) {
    // final RegExp mask = RegExp(
    //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$',
    // );
    final mask = RegExp(r'^[\w\.-]+@unah\.hn$');
    
    return mask.hasMatch(correo);
  }

  static bool passwordValidator(String contrasena) {
    //almenos un caracter especial => (?=.*[@$!%*?&]) , minimo de 8 caracteres => {8,}
    //final RegExp mask = RegExp(r'^(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    final RegExp mask = RegExp(
      r'^(?=.*[.,\-;:%$@&*!¡¿?_])[A-Za-z\d.,-;:%$@&*!¡¿?_]{6,}$',
    );
    print(mask.hasMatch('megmin2121')); 
    print(mask.hasMatch('megmin2121@'));
    return mask.hasMatch(contrasena);
  }

  // static bool addUser({required String email, required String password}) {
  //   try {
  //     users.add(User(name: 'Usuario ${users.length + 1}', email: email, password: password));
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static showSnackBar({
    required BuildContext context,
    required String title,
    Color? color,
  }) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(title), backgroundColor: color));
  }
}
