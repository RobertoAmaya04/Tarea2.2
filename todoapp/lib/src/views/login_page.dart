import 'package:flutter/material.dart';
import 'package:todoapp/src/widgets/custom_snackbar.dart';
import 'package:todoapp/src/widgets/custom_text_input.dart';
import 'package:todoapp/src/widgets/simple_text_input.dart';
import 'package:todoapp/src/widgets/utils.dart';
import 'package:go_router/go_router.dart';

class SessionPage extends StatefulWidget {
  SessionPage({super.key});

  @override
  State<StatefulWidget> createState() => _SesionsState();
}

class _SesionsState extends State<SessionPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool login = true;

  @override
  Widget build(BuildContext context) {
    if (login) {
      return _SingIn();
    } else {
      return _SignUp();
    }
  }

  Widget _SingIn() {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              //const SizedBox(height: 16),
              CustomTextInput(
                type: CustomTextInputType.email,
                cont: emailController,
              ),
              const SizedBox(height: 12),
              CustomTextInput(
                type: CustomTextInputType.password,
                cont: passwordController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        emailController.text = '';
                        passwordController.text = '';
                        login = false;
                      });
                    },
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[300],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final user = Utils.loginUser(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (user != null) {
                    context.goNamed('menu', extra: user);
                  } else {
                    CustomSnackBar.show(
                      context,
                      message: "Correo y contraseña no válidos",
                      backgroundColor: Colors.red,
                    );
                  }
                  //TODO: Aqui metes un else con el snackbar de error (para decir que el correo o contraseña es invalido)
                },
                child: const Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SignUp() {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CREAR CUENTA',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              SimpleInput(cont: nameController, label: "Nombre"),
              const SizedBox(height: 16),
              CustomTextInput(
                type: CustomTextInputType.email,
                cont: emailController,
              ),
              const SizedBox(height: 12),
              SimpleInput(
                cont: phoneController,
                label: "Teléfono",
                keyboard: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              CustomTextInput(
                type: CustomTextInputType.password,
                cont: passwordController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        emailController.text = '';
                        passwordController.text = '';
                        login = true;
                      });
                    },
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (nameController.text.isEmpty) {
                    CustomSnackBar.show(
                      context,
                      message: "Debe llenar el campo nombre",
                    );
                    return;
                  }

                  if (emailController.text.isEmpty) {
                    CustomSnackBar.show(
                      context,
                      message: "Debe llenar el campo correo",
                    );
                    return;
                  }

                  if (!Utils.emailValidator(emailController.text)) {
                    //emailController.text = '';
                    CustomSnackBar.show(
                      context,
                      message: 'El correo debe ser "@unah.hn"',
                      backgroundColor: Colors.redAccent,
                      icon: Icons.error_outline,
                      duration: Duration(seconds: 3),
                    );
                    return;
                  }

                  if (phoneController.text.isEmpty) {
                    CustomSnackBar.show(
                      context,
                      message: "Debe llenar el campo Teléfono",
                    );
                    return;
                  }

                  if (passwordController.text.isEmpty) {
                    CustomSnackBar.show(
                      context,
                      message: "Debe llenar el campo Contraseña",
                    );
                    return;
                  }

                  if (!Utils.passwordValidator(passwordController.text)) {
                    //passwordController.text = '';
                    CustomSnackBar.show(
                      context,
                      message:
                          'La contraseña debe contener letras, numeros y un caracter especial',
                      backgroundColor: Colors.orangeAccent,
                      icon: Icons.lock_outline,
                      duration: Duration(seconds: 3),
                    );
                    return;
                  }

                  CustomSnackBar.show(
                    context,
                    message: 'Cuenta creada exitosamente 🎉',
                    backgroundColor: Colors.green,
                    icon: Icons.check_circle_outline,
                  );

                  setState(() {
                    passwordController.text = '';
                    login = true;
                  });
                },
                child: const Text('Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
