import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/media_card_widget.dart';
import 'package:movies_app/ui/widgets/media_parameters.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({
    super.key,
    required this.movies,
    required this.cardWidth,
    required this.cardHeight,
  });
  final List<MovieModel> movies;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            context.go(
              "${AppRoutes.home}/${AppRoutes.movieDetails}",
              extra: [movies[i].id, movies[i].title],
            );
          },
          child: MediaCardWidget(
            image: ImageFormatter.formatImageWidget(
              context,
              imagePath: movies[i].posterPath,
              height: cardHeight,
              width: cardWidth,
            ),
            width: cardWidth,
            title: movies[i].title ?? "None",
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}

class SeriesListView extends StatelessWidget {
  const SeriesListView({
    super.key,
    required this.series,
    required this.cardWidth,
    required this.cardHeight,
  });
  final List<SeriesModel> series;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            context.go(
              "${AppRoutes.home}/${AppRoutes.seriesDetails}",
              extra: [series[i].id, series[i].name],
            );
          },
          child: MediaCardWidget(
            image: ImageFormatter.formatImageWidget(
              context,
              imagePath: series[i].posterPath,
              height: cardHeight,
              width: cardWidth,
            ),
            width: cardWidth,
            title: series[i].name ?? "None",
          ),
        );
      },
      itemCount: series.length,
    );
  }
}

class PersonListView extends StatelessWidget {
  const PersonListView({
    super.key,
    required this.persons,
    required this.cardWidth,
    required this.cardHeight,
  });
  final List<PersonModel> persons;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return MediaCardWidget(
          image: ImageFormatter.formatImageWidget(
            context,
            imagePath: persons[i].profilePath,
            height: cardHeight,
            width: cardWidth,
          ),
          width: cardWidth,
          title: persons[i].name ?? "None",
        );
      },
      itemCount: persons.length,
    );
  }
}

class SearchMediaList extends StatelessWidget {
  const SearchMediaList({
    super.key,
    required this.media,
  });

  final List<TMDBModel> media;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        final mediaModel = media[i];
        if (mediaModel is MovieModel) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: ImageFormatter.formatImageWidget(context,
                        imagePath: mediaModel.posterPath,
                        height: double.infinity,
                        width: 140),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaModel.title ?? 'none',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Parameters(
                        voteAverage: mediaModel.voteAverage.toStringAsFixed(1),
                        releaseDate: mediaModel.releaseDate ?? "none",
                        origTitle: mediaModel.originalTitle.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              // нажатие
            },
          );
        }
        if (mediaModel is SeriesModel) {
          return ListTile(
            // contentPadding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: ImageFormatter.formatImageWidget(
                      context,
                      imagePath: mediaModel.posterPath,
                      height: double.infinity,
                      width: 140,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaModel.name ?? 'none',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Parameters(
                        voteAverage: mediaModel.voteAverage.toStringAsFixed(1),
                        releaseDate: mediaModel.firstAirDate ?? "none",
                        origTitle: mediaModel.originalName.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              // нажатие
            },
          );
        }
        if (mediaModel is PersonModel) {
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: ImageFormatter.formatImageWidget(context,
                        imagePath: mediaModel.profilePath,
                        height: double.infinity,
                        width: 140),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaModel.name ?? 'none',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              // нажатие
            },
          );
        }
        return null;
      },
      separatorBuilder: (context, i) => const SizedBox(
        height: 1,
      ),
      itemCount: media.length,
    );
  }
}
