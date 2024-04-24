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
    final curUri =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final String initialPath;
    if (curUri.contains("home")) {
      initialPath = AppRoutes.home;
    } else {
      initialPath = AppRoutes.search;
    }

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            context.push(
              "$initialPath/${AppRoutes.movieDetails}/${movies[i].id}",
              extra: [movies[i].id, movies[i].title],
            );
          },
          child: MediaCardWidget(
            textWidth: 140,
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
    final curUri =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final String initialPath;
    if (curUri.contains("home")) {
      initialPath = AppRoutes.home;
    } else {
      initialPath = AppRoutes.search;
    }

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            context.push(
              "$initialPath/${AppRoutes.seriesDetails}/${series[i].id}",
              extra: [series[i].id, series[i].name],
            );
          },
          child: MediaCardWidget(
            textWidth: 140,
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

class ActorsListView extends StatelessWidget {
  const ActorsListView({
    super.key,
    required this.actors,
    required this.cardWidth,
    required this.cardHeight,
  });
  final List<PersonModel> actors;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final curUri =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final String initialPath;
    if (curUri.contains("home")) {
      initialPath = AppRoutes.home;
    } else {
      initialPath = AppRoutes.search;
    }

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            context.push(
              "$initialPath/${AppRoutes.personDetails}/${actors[i].id}",
              extra: [actors[i].id, actors[i].name],
            );
          },
          child: MediaCardWidget(
            textWidth: 140,
            image: ImageFormatter.formatImageWidget(
              context,
              imagePath: actors[i].profilePath,
              height: cardHeight,
              width: cardWidth,
            ),
            width: cardWidth,
            title: actors[i].name ?? "None",
          ),
        );
      },
      itemCount: actors.length,
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
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, i) {
        final mediaModel = media[i];
        if (mediaModel is MovieModel) {
            return MediaListTile(
              posterPath: mediaModel.posterPath ??
                  "assets/images/unknown_media_image.webp",
              title: mediaModel.title ?? "None",
              voteAverage: mediaModel.voteAverage.toStringAsFixed(1),
              releaseDate: mediaModel.releaseDate ?? "none",
              origTitle: mediaModel.originalTitle.toString(),
              onTap: () {
                context.push(
                  "${AppRoutes.search}/${AppRoutes.movieDetails}/${mediaModel.id}",
                  extra: [mediaModel.id, mediaModel.title],
                );
              },
            );
        }
        if (mediaModel is SeriesModel) {
          if (mediaModel.posterPath != null) {
            return MediaListTile(
              posterPath: mediaModel.posterPath ??
                  "assets/images/unknown_media_image.webp",
              title: mediaModel.name ?? "None",
              voteAverage: mediaModel.voteAverage.toStringAsFixed(1),
              releaseDate: mediaModel.firstAirDate ?? "none",
              origTitle: mediaModel.originalName.toString(),
              onTap: () {
                context.push(
                  "${AppRoutes.search}/${AppRoutes.seriesDetails}/${mediaModel.id}",
                  extra: [mediaModel.id, mediaModel.name],
                );
              },
            );
          }
        }
        if (mediaModel is PersonModel) {
          if (mediaModel.profilePath != null) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 10, left: 16, right: 16),
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
                        imagePath: mediaModel.profilePath,
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
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                context.push(
                  "${AppRoutes.search}/${AppRoutes.personDetails}/${mediaModel.id}",
                  extra: [mediaModel.id, mediaModel.name],
                );
              },
            );
          }
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

class MediaListTile extends StatelessWidget {
  const MediaListTile({
    super.key,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.origTitle,
    this.onTap,
  });

  final String posterPath;
  final String title;
  final String voteAverage;
  final String releaseDate;
  final String origTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
              child: ImageFormatter.formatImageWidget(
                context,
                imagePath: posterPath,
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
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                MediaParameters(
                  voteAverage: voteAverage,
                  releaseDate: releaseDate,
                  origTitle: origTitle,
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
