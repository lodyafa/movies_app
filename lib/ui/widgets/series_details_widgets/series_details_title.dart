import 'package:flutter/widgets.dart';

class SeriesDetailsTitle extends StatelessWidget {
  const SeriesDetailsTitle({
    super.key,
    this.seriesTitle,
  });

  final String? seriesTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Text(
          seriesTitle ?? "Unknown title",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
