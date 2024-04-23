import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/cubits/auth_screen_cubit/auth_screen_cubit.dart';

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