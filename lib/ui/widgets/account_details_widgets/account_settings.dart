import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/themes/theme.dart';
import 'package:movies_app/ui/widgets/account_details_widgets/custom_settings_button.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Column(children: [
        const ChangeThemeButton(),
        const SizedBox(height: 15),
        CustomSettingsButton(
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
      ]),
    );
  }
}

class LogoutConfirmationDialog extends StatelessWidget {
  final void Function() onConfirm;

  const LogoutConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).extension<ThemeColors>()!.searchAppBarColor,
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
              color: Theme.of(context).extension<ThemeColors>()!.btmNvgBarActiveIconColor,
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
