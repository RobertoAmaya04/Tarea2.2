import 'package:flutter/material.dart';
import 'package:todoapp/src/widgets/custom_snackbar.dart';
import 'package:todoapp/src/widgets/custom_text_input.dart';
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
      backgroundColor: Colors.lightBlue[200],
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.purple[200],
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
              const SizedBox(height: 16),
              const SizedBox(height: 16),
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
                  backgroundColor: Colors.lightBlue[100],
                  foregroundColor: Colors.black,
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
                  }
                  //TODO: Aqui metes un else con el snackbar de error (para decir que el correo o contraseña es invalido)
                },
                child: const Text('Iniciar sesion'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SignUp() {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.purple[200],
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
              const SizedBox(height: 16),
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
                  backgroundColor: Colors.lightBlue[100],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (!Utils.emailValidator(emailController.text)) {
                    emailController.text = '';
                    CustomSnackBar.show(
                      context,
                      message: 'Correo inválido',
                      backgroundColor: Colors.redAccent,
                      icon: Icons.error_outline,
                    );
                    return;
                  }

                  if (!Utils.passwordValidator(passwordController.text)) {
                    passwordController.text = '';
                    CustomSnackBar.show(
                      context,
                      message: 'Contraseña inválida',
                      backgroundColor: Colors.orangeAccent,
                      icon: Icons.lock_outline,
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
