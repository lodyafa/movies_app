import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';

class HomeCategoryList<T> extends StatelessWidget {
  const HomeCategoryList({
    super.key,
    required this.title,
    required this.media,
    required this.cardWidth,
    required this.cardHeight,
  });

  final String title;
  final List<T> media;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    Widget? mediaList;

    if (T == MovieModel) {
      mediaList = MoviesListView(
        cardHeight: cardHeight,
        cardWidth: cardWidth,
        movies: media.cast<MovieModel>(),
      );
    } else if (T == SeriesModel) {
      mediaList = SeriesListView(
        cardWidth: cardWidth,
        cardHeight: cardHeight,
        series: media.cast<SeriesModel>(),
      );
    } else if (T == PersonModel) {
      mediaList = PersonListView(
        cardWidth: cardWidth,
        cardHeight: cardHeight,
        persons: media.cast<PersonModel>(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                // context.go("/all_movies");
              },
              child: const Text("All"),
            ),
          ],
        ),
        SizedBox(
          height: 256,
          width: double.infinity,
          child: mediaList,
        ),
      ],
    );
  }
}
