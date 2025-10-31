import 'package:todoapp/src/api/fake_data.dart';
import 'package:todoapp/src/api/models/user.dart';

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
    final RegExp mask = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$',
    );
    return mask.hasMatch(correo);
  }

  static bool passwordValidator(String correo) {
    //almenos un caracter especial => (?=.*[@$!%*?&]) , minimo de 8 caracteres => {8,}
    final RegExp mask = RegExp(r'^(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return mask.hasMatch(correo);
  }

  // static bool addUser({required String email, required String password}) {
  //   try {
  //     users.add(User(name: 'Usuario ${users.length + 1}', email: email, password: password));
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static User? loginUser({required String email, required String password}) {
    if (email == 'amehd.mendez@unah.hn' && password == '20232030664') {
      return amehd;
    } else if (email == 'rcamaya@unah.hn' && password == '20232030549') {
      return roberto;
    }
    return null;
  }
}
