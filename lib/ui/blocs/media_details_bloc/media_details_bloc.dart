import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

part 'media_details_event.dart';
part 'media_details_state.dart';

class MediaDetailsBloc extends Bloc<MediaDetailsEvent, MediaDetailsState> {
  late final MediaClient _tmdbMediaClient;

  MediaDetailsBloc({
    required MediaClient tmdbMediaClient,
  })  : _tmdbMediaClient = tmdbMediaClient,
        super(MediaDetailsState()) {
    on<AllMediaDetailsEvent>(_onAllMediaDetails);
    on<LoadMovieDetailsEvent>(_onMovieDetails);
    on<LoadSeriesDetailsEvent>(_onSeriesDetails);
    on<LoadPersonDetailsEvent>(_onPersonDetails);
  }

  Future<void> _onAllMediaDetails(
      AllMediaDetailsEvent event, Emitter<MediaDetailsState> emit) async {
    emit(state.copyWith(isLoading: true));

    final MovieModel movieDetails = await _tmdbMediaClient.getMovieDetails(
      locale: event.locale,
      movieId: event.id,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final SeriesModel seriesDetails = await _tmdbMediaClient.getSeriesDetails(
      locale: event.locale,
      seriesId: event.id,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final PersonModel personDetails = await _tmdbMediaClient.getPersonDetails(
      locale: event.locale,
      personId: event.id,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    emit(state.copyWith(
      movieDetails: movieDetails,
      seriesDetails: seriesDetails,
      personDetails: personDetails,
    ));
  }

  _onMovieDetails(
      LoadMovieDetailsEvent event, Emitter<MediaDetailsState> emit) async {
    final MovieModel movieDetails = await _tmdbMediaClient.getMovieDetails(
      locale: event.locale,
      movieId: event.movieId,
    );
    // if (movieDetails.isEmpty) return;
    emit(state.copyWith(movieDetails: movieDetails));
  }

  _onSeriesDetails(
      LoadSeriesDetailsEvent event, Emitter<MediaDetailsState> emit) async {
    final SeriesModel seriesDetails = await _tmdbMediaClient.getSeriesDetails(
      locale: event.locale,
      seriesId: event.seriesId,
    );
    // if (movieDetails.isEmpty) return;
    emit(state.copyWith(seriesDetails: seriesDetails));
  }

  _onPersonDetails(
      LoadPersonDetailsEvent event, Emitter<MediaDetailsState> emit) async {
    final PersonModel personDetails = await _tmdbMediaClient.getPersonDetails(
      locale: event.locale,
      personId: event.personId,
    );
    // if (movieDetails.isEmpty) return;
    emit(state.copyWith(personDetails: personDetails));
  }
}
