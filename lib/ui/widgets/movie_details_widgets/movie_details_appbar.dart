import 'package:flutter/material.dart';

class MovieDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MovieDetailsAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border_outlined),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
