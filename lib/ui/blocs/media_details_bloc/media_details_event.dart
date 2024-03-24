part of 'media_details_bloc.dart';

class MediaDetailsEvent {}

class LoadMovieDetailsEvent extends MediaDetailsEvent {
  final int movieId;
  final String locale;

  LoadMovieDetailsEvent({
    required this.movieId,
    this.locale = "en-US",
  });
}

class LoadSeriesDetailsEvent extends MediaDetailsEvent {
  final int seriesId;
  final String locale;

  LoadSeriesDetailsEvent({
    required this.seriesId,
    this.locale = "en-US",
  });
}

class LoadPersonDetailsEvent extends MediaDetailsEvent {
  final int personId;
  final String locale;

  LoadPersonDetailsEvent({
    required this.personId,
    this.locale = "en-US",
  });
}
class AllMediaDetailsEvent extends MediaDetailsEvent {
  final int id;
  final String locale;

  AllMediaDetailsEvent({
    required this.id,
    this.locale = "en-US",
  });
}
