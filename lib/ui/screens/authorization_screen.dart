import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/cubits/auth_screen_cubit/auth_screen_cubit.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/text_field_widget.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  void _onAuthViewCubitStateChange(
      BuildContext context, AuthScreenState state) {
    if (state is AuthScreenSuccessState) {
      context.go(AppRoutes.screenLoader);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthScreenCubit(
        initialState: AuthScreenFormFillInProgressState(),
        authBloc: RepositoryProvider.of<AuthBloc>(context),
      ),
      child: BlocListener<AuthScreenCubit, AuthScreenState>(
        listener: _onAuthViewCubitStateChange,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const AuthBody(),
        ),
      ),
    );
  }
}

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
              "Welcome to Movies App",
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

class AuthExceptionWidget extends StatelessWidget {
  const AuthExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit, AuthScreenState>(
      builder: (context, state) {
        final errorMessage = context.select(
          (AuthScreenCubit cubit) {
            final state = cubit.state;
            return state is AuthScreenErrorState ? state.errorMessage : null;
          },
        );
        if (errorMessage == null) return const SizedBox.shrink();
        return Text(
          errorMessage,
          style: TextStyle(
            fontSize: 17,
            color: Theme.of(context).colorScheme.error,
          ),
        );
      },
    );
  }
}

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
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
