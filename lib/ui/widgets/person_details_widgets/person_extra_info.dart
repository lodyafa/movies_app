import 'package:flutter/material.dart';

class PersonExtraInfo extends StatelessWidget {
  const PersonExtraInfo({
    super.key,
    required this.biography,
    required this.birthday,
    required this.placeOfBirth,
  });

  final String? birthday;
  final String? biography;
  final String? placeOfBirth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(width: 5),
            Text(birthday ?? "None"),
            const SizedBox(width: 10),
            const Text("|"),
            const SizedBox(width: 10),
            const Icon(Icons.watch_later_sharp),
            const SizedBox(width: 5),
            Text(placeOfBirth ?? "None"),
          ],
        ),
        const SizedBox(height: 10),
        Text(biography ?? "None"),
      ],
    );
  }
}
