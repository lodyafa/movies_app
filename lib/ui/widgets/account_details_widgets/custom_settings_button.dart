import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/blocs/theme_bloc/theme_bloc.dart';
import 'package:movies_app/ui/themes/theme.dart';

class CustomSettingsButton extends StatelessWidget {
  const CustomSettingsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.height = 55,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.secondary,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BorderRadiusDirection {
  all,
  onlyTop,
  onlyBottom,
  none,
}

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        String btnText = "Switch to ";
        IconData icon;
        ThemeEvent event;
        switch (state.themeMode) {
          case ThemeMode.system:
            btnText += "dark theme";
            event = ThemeToggleDarkThemeEvent();
            icon = Icons.dark_mode_sharp;
          case ThemeMode.dark:
            btnText += "light theme";
            event = ThemeToggleLightThemeEvent();
            icon = Icons.light_mode_sharp;
          case ThemeMode.light:
            btnText += "system theme";
            event = ThemeToggleSystemThemeEvent();
            icon = Icons.settings;
        }
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.read<ThemeBloc>().add(event);
          },
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).extension<ThemeColors>()!.themeButtonColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Animate(
              key: ValueKey(btnText),
              effects: const [ShakeEffect()],
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      btnText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
