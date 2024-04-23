import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/cubits/auth_screen_cubit/auth_screen_cubit.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/auth_widgets/auth_body.dart';

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






