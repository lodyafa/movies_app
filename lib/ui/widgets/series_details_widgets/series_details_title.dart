import 'package:flutter/material.dart';

class SeriesDetailsTitle extends StatelessWidget {
  const SeriesDetailsTitle({
    super.key,
    this.seriesTitle,
  });

  final String? seriesTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(left: 160, right: 25),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Text(
              seriesTitle ?? "Unknown title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
