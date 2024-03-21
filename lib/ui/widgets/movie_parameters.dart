import 'package:flutter/material.dart';

class Parameters extends StatelessWidget {
  const Parameters({
    super.key,
    required this.voteAverage,
    required this.releaseDate,
    required this.origTitle,
  });

  final String voteAverage;
  final String releaseDate;
  final String origTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Characteristics(
          icon: Icons.star_rate,
          text: voteAverage,
          iconColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.primary,
        ),
        Characteristics(
          icon: Icons.calendar_month,
          text: releaseDate,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
        Characteristics(
          icon: Icons.info_outline,
          text: origTitle,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ],
    );
  }
}

class Characteristics extends StatelessWidget {
  const Characteristics({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.textColor,
  });

  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
