import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/cubits/auth_screen_cubit/auth_screen_cubit.dart';

class AuthLoginButton extends StatelessWidget {
  const AuthLoginButton({
    super.key,
    required TextEditingController loginController,
    required TextEditingController passwordController,
  })  : _loginController = loginController,
        _passwordController = passwordController;

  final TextEditingController _loginController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit, AuthScreenState>(
      builder: (context, state) {
        final AuthScreenState state =
            context.select((AuthScreenCubit cubit) => cubit.state);

        final bool canStartAuth = state is AuthScreenFormFillInProgressState ||
            state is AuthScreenErrorState;

        final void Function()? onPressed = canStartAuth
            ? () => context.read<AuthScreenCubit>().onAuth(
                  login: _loginController.text,
                  password: _passwordController.text,
                )
            : null;

        final Widget child = state is AuthScreenAuthInProgressState
            ? SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : const Text('Login');

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surface,
            fixedSize: const Size(90, 50),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
      },
    );
  }
}