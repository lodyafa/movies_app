import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/ui/blocs/account_bloc/account_bloc.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/account_content.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state is AccountFailureState) {
          switch (state.failure.type) {
            case (ApiExceptionType.network):
              return CustomErrorWidget(
                text: "Check your internet connection",
                icon: Icons.wifi_off,
                btnText: "Update",
                onPressed: () => context
                    .read<AccountBloc>()
                    .add(AccountLoadAccountDetailsEvent()),
              );
            case (ApiExceptionType.sessionExpired):
              return CustomErrorWidget(
                text: "Session Expired",
                icon: Icons.exit_to_app,
                btnText: "Login",
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutEvent());
                  context.go(AppRoutes.screenLoader);
                },
              );
            default:
              return CustomErrorWidget(
                text: "Something went wrong...",
                icon: Icons.error,
                btnText: "Update",
                onPressed: () => context
                    .read<AccountBloc>()
                    .add(AccountLoadAccountDetailsEvent()),
              );
          }
        }

        if (state is AccountLoadingState) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Loading your account"),
                SizedBox(height: 10),
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (state is AccountLoadedState) {
          return AccountContent(account: state.accountDetails);
        }

        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Loading your account"),
              SizedBox(height: 10),
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}

