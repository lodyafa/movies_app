import 'package:flutter/widgets.dart';

class PersonDetailsName extends StatelessWidget {
  const PersonDetailsName({
    super.key,
    this.personName,
  });

  final String? personName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Text(
          personName ?? "Unknown name",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
