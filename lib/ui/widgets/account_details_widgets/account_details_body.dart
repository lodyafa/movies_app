import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/account_bloc/account_bloc.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/account_settings.dart';
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

class AccountContent extends StatelessWidget {
  const AccountContent({
    super.key,
    required this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    Widget avatarWidget = ImageFormatter.formatAvatarImageWidget(
      context,
      imagePath: account.avatarPath,
      diameter: 120,
    );
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Theme.of(context).colorScheme.surface,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                avatarWidget,
                const SizedBox(height: 20),
                Text(
                  account.username ?? "Unknown username",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 30),
          child: AccountSettings(),
        ),
      ],
    );
  }
}
