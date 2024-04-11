part of 'series_details_bloc.dart';

class SeriesDetailsEvent {}

class SeriesDetailsLoadDetailsEvent extends SeriesDetailsEvent {
  final String locale;
  final int seriesId;

  SeriesDetailsLoadDetailsEvent({
    this.locale = "en-US",
    required this.seriesId,
  });
}