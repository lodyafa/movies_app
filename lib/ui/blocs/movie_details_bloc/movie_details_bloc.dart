import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  late final MediaClient _mediaClient;

  MovieDetailsBloc({required MediaClient mediaClient})
      : _mediaClient = mediaClient,
        super(MovieDetailsState()) {
    on<MovieDetailsLoadDetailsEvent>(_onLoadMovieDetails);
  }

  Future<void> _onLoadMovieDetails(
    MovieDetailsLoadDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoadingState());
    try {
      MovieModel movieDetails = await _mediaClient.getMovieDetails(
        movieId: event.movieId,
        locale: event.locale,
      );

      List<PersonModel> movieActors = await _mediaClient.getMovieActors(
        locale: event.locale,
        movieId: event.movieId,
      );

      emit(MovieDetailsLoadedState(
        movieDetails: movieDetails,
        movieActors: movieActors,
      ));
    } on ApiException catch (exception) {
      emit(MovieDetailsFailureState(failure: exception));
    }
  }
}
