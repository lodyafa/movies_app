part of 'movie_details_bloc.dart';

class MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieModel movieDetails;
  final List<PersonModel> movieActors;
  final List<MovieModel>? similarMovies;

  MovieDetailsLoadedState({
    required this.movieDetails,
    required this.movieActors,
    required this.similarMovies,
  });
}

class MovieDetailsFailureState extends MovieDetailsState {
  final ApiException failure;

  MovieDetailsFailureState({required this.failure});
}
