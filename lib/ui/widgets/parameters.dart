import 'package:flutter/material.dart';

class Parameters extends StatelessWidget {
  const Parameters({
    super.key,
    required this.voteAverage,
    required this.releaseDate,
    required this.time,
  });

  final String voteAverage;
  final String releaseDate;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
          icon: Icons.access_time,
          text: time,
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
        Text(
          text,
          style: TextStyle(
            color: textColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}