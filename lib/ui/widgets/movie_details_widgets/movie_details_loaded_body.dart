import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_details_title.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_extra_info.dart';

class MovieDetailsLoadedBody extends StatelessWidget {
  const MovieDetailsLoadedBody({
    super.key,
    required this.movie,
    required this.movieActors,
    required this.movies,
  });

  final MovieModel movie;
  final List<MovieModel> movies;
  final List<PersonModel> movieActors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            children: [
              Column(
                children: [
                  ImageFormatter.formatImageWidget(
                    context,
                    imagePath: movie.backdropPath,
                    height: 250,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.background,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 160, right: 25),
                      child: MovieDetailsTitle(
                        movieTitle: movie.title,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 160,
                left: 30,
                child: ImageFormatter.formatImageWidget(
                  context,
                  imagePath: movie.posterPath,
                  height: 180,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MovieExtraInfo(
            releaseDate: movie.releaseDate,
            runtime: movie.runtime,
            voteAverage: movie.voteAverage.toStringAsFixed(1),
            genres: movie.genres ?? [],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.overview ?? "none",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Text(
                "Cast",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: PersonListView(
                  persons: movieActors,
                  cardWidth: 140,
                  cardHeight: 210,
                ),
              ),
              Text(
                "Similar Movies",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: MoviesListView(
                  movies: movies,
                  cardWidth: 140,
                  cardHeight: 210,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
