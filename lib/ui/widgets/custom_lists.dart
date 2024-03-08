import 'package:flutter/material.dart';
import 'package:movies_app/data/clients/tmdb_image.dart';
import 'package:movies_app/models/tmdb_models.dart';
import 'package:movies_app/ui/widgets/movie_card_widget.dart';

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