import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/data/clients/tmdb_media_client.dart';
import 'package:movies_app/models/tmdb_models.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late final TMDBMediaClient _tmdbMediaClient;

  SearchBloc({
    required TMDBMediaClient tmdbMediaClient,
  })  : _tmdbMediaClient = tmdbMediaClient,
        super(SearchState()) {
    on<LoadSearchMediaEvent>(
      _onSearchMedia,
      transformer: debounceDroppable(
        const Duration(milliseconds: 500),
      ),
    );
  }

  Future<void> _onSearchMedia(
      LoadSearchMediaEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<TMDBModel> media = await _tmdbMediaClient.getSearchMedia(
      locale: event.locale,
      page: event.page,
      query: event.query,
    );
    if (media.isEmpty) return;
    emit(state.copyWith(searchMedia: media));
  }
}
