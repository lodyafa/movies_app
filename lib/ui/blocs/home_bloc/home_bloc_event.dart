part of 'home_bloc.dart';

class HomeBlocEvent {}

class HomePopularMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularMoviesEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}

class HomePopularTVSeriesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularTVSeriesEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}

class HomeTrendingMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomeTrendingMoviesEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}

class HomeNowPlayingMoviesEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomeNowPlayingMoviesEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}

class HomePopularPeopleEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomePopularPeopleEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}

class HomeAllMediaEvent extends HomeBlocEvent {
  final String locale;
  final int page;

  HomeAllMediaEvent({
    this.locale = "en-US",
    this.page = 1,
  });
}
