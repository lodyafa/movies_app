import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/auth_widgets/auth_exception_widget.dart';
import 'package:movies_app/ui/widgets/auth_widgets/auth_login_button.dart';
import 'package:movies_app/ui/widgets/text_field_widget.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthExceptionWidget(),
            Text(
              "Welcome to The Movie Database",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            TextFieldWidget(
              controller: loginController,
              hintText: "Enter your login",
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: passwordController,
              hintText: "Enter your password",
            ),
            const SizedBox(height: 20),
            AuthLoginButton(
              loginController: loginController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}