import 'package:flutter/material.dart';
import 'package:todoapp/src/widgets/custom_text_input.dart';
import 'package:todoapp/src/widgets/utils.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginBckground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.blue[100]),

            child: Column(
              children: [
                Text('Login'),
                SizedBox(width: 8),
                CustomTextInput(
                  type: CustomTextInputType.email,
                  cont: emailController,
                ),
                CustomTextInput(
                  type: CustomTextInputType.password,
                  cont: passwordController,
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    if (Utils.emailValidator(emailController.text) &&
                        Utils.passwordValidator(passwordController.text)) {
                      context.goNamed('menu');
                    }
                  },
                  child: Text('Iniciar sesion'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
