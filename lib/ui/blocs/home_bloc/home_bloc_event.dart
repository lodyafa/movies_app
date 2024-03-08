part of 'home_bloc.dart';

class HomeBlocEvent {}

class HomePopularMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularMoviesEvent(
    this.locale,
    this.page,
  );
}

class HomePopularTVSeriesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularTVSeriesEvent(
    this.locale,
    this.page,
  );
}

class HomeTrendingMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomeTrendingMoviesEvent(
    this.locale,
    this.page,
  );
}

class HomeNowPlayingMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomeNowPlayingMoviesEvent(
    this.locale,
    this.page,
  );
}

class HomePopularPeopleEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularPeopleEvent(
    this.locale,
    this.page,
  );
}