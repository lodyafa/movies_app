import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';
import 'package:movies_app/ui/widgets/movie_details_title.dart';
import 'package:movies_app/ui/widgets/movie_extra_info.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsFailureState) {
          switch (state.failure.type) {
            case (ApiExceptionType.network):
              return CustomErrorWidget(
                text: "Check your internet connection",
                icon: Icons.wifi_off,
                btnText: "Update",
                onPressed: () => context
                    .read<MovieDetailsBloc>()
                    .add(MovieDetailsLoadDetailsEvent(
                      movieId: movieId,
                    )),
              );
            default:
              return CustomErrorWidget(
                text: "Something wrong...",
                icon: Icons.error,
                btnText: "Update",
                onPressed: () {},
              );
          }
        }

        if (state is MovieDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieDetailsLoadedState) {
          return MovieDetailsLoadedBody(
            movie: state.movieDetails,
            movieActors: state.movieActors,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

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
        Stack(
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
                    padding: const EdgeInsets.only(left: 170, right: 25),
                    child: MovieDetailsTitle(
                      movieTitle: movie.title,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150,
              left: 30,
              child: ImageFormatter.formatImageWidget(context,
                  imagePath: movie.posterPath, height: 180, width: 120),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MovieExtraInfo(
            releaseDate: movie.releaseDate,
            runtime: movie.runtime,
            productionCountries: movie.productionCountries ?? [],
            genres: movie.genres ?? [],
          ),
        )
      ],
    );
  }
}
