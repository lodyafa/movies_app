part of 'home_bloc.dart';

class HomeBlocState {
  final List<MovieModel> popularMovies;
  final List<MovieModel> trendingMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<SeriesModel> popularSeries;
  final List<PersonModel> popularPeople;
  final bool isLoading;

  HomeBlocState({
    this.popularMovies = const [],
    this.popularSeries = const [],
    this.trendingMovies = const [],
    this.nowPlayingMovies = const [],
    this.popularPeople = const [],
    this.isLoading = false,
  });

  HomeBlocState copyWith({
    List<MovieModel>? popularMovies,
    List<MovieModel>? trendingMovies,
    List<MovieModel>? nowPlayingMovies,
    List<SeriesModel>? popularSeries,
    List<PersonModel>? popularPeople,
    bool? isLoading = false,
  }) {
    return HomeBlocState(
      popularMovies: popularMovies ?? this.popularMovies,
      popularSeries: popularSeries ?? this.popularSeries,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularPeople: popularPeople ?? this.popularPeople,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
