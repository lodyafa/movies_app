import 'package:flutter/material.dart';
import 'package:movies_app/data/clients/tmdb_image.dart';
import 'package:movies_app/models/tmdb_models.dart';
import 'package:movies_app/ui/widgets/movie_card_widget.dart';
import 'package:movies_app/ui/widgets/parameters.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.movies});
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return MovieCardWidget(
          image: movies[i].posterPath != null
              ? Image.network(
                  TMDBImage.formatImageUrl(
                    path: movies[i].posterPath!,
                  ),
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                  fit: BoxFit.cover,
                ),
          width: 140,
          title: movies[i].title ?? "None",
        );
      },
      itemCount: movies.length,
    );
  }
}

class PopularSeriesListView extends StatelessWidget {
  const PopularSeriesListView({super.key, required this.popularSeries});
  final List<SeriesModel> popularSeries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return MovieCardWidget(
          image: popularSeries[i].posterPath != null
              ? Image.network(
                  TMDBImage.formatImageUrl(
                    path: popularSeries[i].posterPath!,
                  ),
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                  fit: BoxFit.cover,
                ),
          width: 140,
          title: popularSeries[i].name ?? "None",
        );
      },
      itemCount: popularSeries.length,
    );
  }
}

class PopularPeopleListView extends StatelessWidget {
  const PopularPeopleListView({super.key, required this.popularPeople});
  final List<PersonModel> popularPeople;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
      itemBuilder: (ctx, i) {
        return MovieCardWidget(
          image: popularPeople[i].profilePath != null
              ? Image.network(
                  TMDBImage.formatImageUrl(
                    path: popularPeople[i].profilePath!,
                  ),
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                  fit: BoxFit.cover,
                ),
          width: 140,
          title: popularPeople[i].name ?? "None",
        );
      },
      itemCount: popularPeople.length,
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
                    child: mediaModel.posterPath != null
                        ? Image.network(
                            TMDBImage.formatImageUrl(
                              path: mediaModel.posterPath!,
                            ),
                            height: 256,
                            width: 140,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                            fit: BoxFit.cover,
                          ),
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
                      // Characteristics(
                      //   icon: Icons.star_rate,
                      //   text: mediaModel.voteAverage.toStringAsFixed(1),
                      // ),
                      // Characteristics(
                      //   icon: Icons.calendar_month,
                      //   text: mediaModel.releaseDate ?? "none",
                      // ),
                      // Characteristics(
                      //   icon: Icons.access_time,
                      //   text: mediaModel.runtime.toString(),
                      // ),
                      Parameters(
                        voteAverage: mediaModel.voteAverage.toStringAsFixed(1),
                        releaseDate: mediaModel.releaseDate ?? "none",
                        time: mediaModel.runtime.toString(),
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
                    child: mediaModel.posterPath != null
                        ? Image.network(
                            TMDBImage.formatImageUrl(
                              path: mediaModel.posterPath!,
                            ),
                            height: 256,
                            width: 140,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                            fit: BoxFit.cover,
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
                        time: mediaModel.episodeRunTime.toString(),
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
                    child: mediaModel.profilePath != null
                        ? Image.network(
                            TMDBImage.formatImageUrl(
                              path: mediaModel.profilePath!,
                            ),
                            width: 140,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://ir.ozone.ru/s3/multimedia-g/c1000/6579294784.jpg",
                            fit: BoxFit.cover,
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
              // нажатие
            },
          );
        }
      },
      separatorBuilder: (context, i) => const SizedBox(
        height: 1,
      ),
      itemCount: media.length,
    );
  }
}



