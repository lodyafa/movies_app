part of 'home_bloc.dart';

class HomeState {}

class HomeBlocLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<MovieModel> popularMovies;
  final List<MovieModel> trendingMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<SeriesModel> popularSeries;
  // final List<SeriesModel> trendingTVSeries;
  final List<PersonModel> popularPeople;

  HomeLoadedState({
    required this.popularMovies,
    required this.trendingMovies,
    required this.nowPlayingMovies,
    required this.popularSeries,
    // required this.trendingTVSeries,
    required this.popularPeople,
  });
}

class HomeFailureState extends HomeState {
  final ApiException failure;

  HomeFailureState({
    required this.failure,
  });
}
