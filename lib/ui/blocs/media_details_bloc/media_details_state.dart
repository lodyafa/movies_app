part of 'media_details_bloc.dart';

class MediaDetailsState {
  final MovieModel? movieDetails;
  final SeriesModel? seriesDetails;
  final PersonModel? personDetails;
  final bool isLoading;

  MediaDetailsState({
    this.movieDetails,
    this.seriesDetails,
    this.personDetails,
    this.isLoading = false,
  });

  MediaDetailsState copyWith({
    MovieModel? movieDetails,
    SeriesModel? seriesDetails,
    PersonModel? personDetails,
    bool? isLoading = false,
  }) {
    return MediaDetailsState(
      movieDetails: movieDetails ?? movieDetails,
      seriesDetails: seriesDetails ?? seriesDetails,
      personDetails: personDetails ?? personDetails,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// final class MediaDetailsLoadingState extends MediaDetailsState {}

// final class MediaDetailsLoadedState extends MediaDetailsState {
//   final TMDBModel mediaModel;

//   MediaDetailsLoadedState({required this.mediaModel});
// }

// final class MediaDetailsFailureState extends MediaDetailsState {}
