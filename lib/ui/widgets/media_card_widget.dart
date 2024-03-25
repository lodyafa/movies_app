import 'package:flutter/material.dart';

class MediaCardWidget extends StatelessWidget {
  const MediaCardWidget({
    super.key,
    required this.image,
    required this.width,
    required this.title,
  });

  final Widget image;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          child: image,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 140,
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
