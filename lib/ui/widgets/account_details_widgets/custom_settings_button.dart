import 'package:flutter/material.dart';

class CustomSettingsButton extends StatelessWidget {
  const CustomSettingsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.borderRadiusDirection = BorderRadiusDirection.onlyTop,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;
  final double height;
  final BorderRadiusDirection borderRadiusDirection;

  @override
  Widget build(BuildContext context) {
    dynamic borderRadius;
    switch (borderRadiusDirection) {
      case BorderRadiusDirection.onlyTop:
        borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        );
        break;
      case BorderRadiusDirection.onlyBottom:
        borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        );
        break;
      case BorderRadiusDirection.none:
        borderRadius = BorderRadius.zero;
        break;
      case BorderRadiusDirection.all:
        borderRadius = BorderRadius.circular(12);
        break;
    }

    return Material(
      borderRadius: borderRadius,
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.secondary,
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