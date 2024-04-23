part of 'all_media_bloc.dart';

enum AllMediaStatus { initial, success, failure }

class AllMediaState {
  AllMediaState({
    this.status = AllMediaStatus.initial,
    this.models = const <TMDBModel>[],
    this.page = 1,
    this.failure,
    this.hasReachedMax = false,
  });

  final AllMediaStatus status;
  final List<TMDBModel> models;
  final int page;
  final ApiExceptionType? failure;
  final bool hasReachedMax;

  AllMediaState copyWith({
    AllMediaStatus? status,
    List<TMDBModel>? models,
    int? page,
    ApiExceptionType? failure,
    bool? hasReachedMax = false,
  }) {
    return AllMediaState(
      status: status ?? this.status,
      models: models ?? this.models,
      page: page ?? this.page,
      failure: failure ?? this.failure,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}