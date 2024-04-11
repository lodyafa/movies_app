part of 'series_details_bloc.dart';

class SeriesDetailsState {}

final class SeriesDetailsLoadingState extends SeriesDetailsState {}

final class SeriesDetailsLoadedState extends SeriesDetailsState {
  final SeriesModel seriesDetails;
  final List<PersonModel> seriesActors;
  final List<SeriesModel>? similarSeries;

  SeriesDetailsLoadedState({
    required this.seriesDetails,
    required this.seriesActors,
    required this.similarSeries,
  });
}

final class SeriesDetailsFailureState extends SeriesDetailsState {
  final ApiException failure;

  SeriesDetailsFailureState({required this.failure});
}
