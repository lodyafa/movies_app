import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_details_title.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_extra_info.dart';

class MovieDetailsLoadedBody extends StatelessWidget {
  const MovieDetailsLoadedBody({
    super.key,
    required this.movie,
    required this.movieActors,
  });

  final MovieModel movie;
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MovieExtraInfo(
            releaseDate: movie.releaseDate,
            runtime: movie.runtime,
            // productionCountries: movie.productionCountries ?? [],
            voteAverage: movie.voteAverage.toStringAsFixed(1),
            genres: movie.genres ?? [],
          ),
        )
      ],
    );
  }
}
