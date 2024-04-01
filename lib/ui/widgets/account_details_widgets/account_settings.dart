import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/custom_settings_button.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          CustomSettingsButton(
            borderRadiusDirection: BorderRadiusDirection.onlyTop,
            icon: Icons.colorize_outlined,
            text: "Change theme",
            onPressed: () {},
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 15,
            color: Theme.of(context).colorScheme.secondary,
          ),
          CustomSettingsButton(
            borderRadiusDirection: BorderRadiusDirection.onlyBottom,
            icon: Icons.logout,
            text: "Logout",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LogoutConfirmationDialog(
                    onConfirm: () {
                      context.read<AuthBloc>().add(AuthLogoutEvent());
                      context.go(AppRoutes.screenLoader);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class LogoutConfirmationDialog extends StatelessWidget {
  final void Function() onConfirm;

  const LogoutConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            "Logout",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
