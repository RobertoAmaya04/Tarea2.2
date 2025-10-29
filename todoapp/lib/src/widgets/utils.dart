class Utils {
  static bool emailValidator(String correo) {
    final RegExp mask = RegExp(r'^[a-zA-Z0-9.]@unah.hn');
    return mask.hasMatch(correo);
  }

  static bool passwordValidator(String correo) {
    //almenos un caracter especial => (?=.*[@$!%*?&]) , minimo de 8 caracteres => {8,}
    final RegExp mask = RegExp(r'^(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return mask.hasMatch(correo);
  }
}
