import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:stream_transform/stream_transform.dart';

part 'all_media_event.dart';
part 'all_media_state.dart';

enum ApiMediaQueryType {
  popularMovies,
  popularSeries,
  trendingMovies,
  nowPlayingMovies,
  popularActors
}

extension ApiMediaQueryTypeX on ApiMediaQueryType {
  String asString() {
    switch (this) {
      case ApiMediaQueryType.popularMovies:
        return 'popular_movies';
      case ApiMediaQueryType.trendingMovies:
        return 'trending_movies';
      case ApiMediaQueryType.popularSeries:
        return 'popular_series';
      case ApiMediaQueryType.nowPlayingMovies:
        return 'now_playing_movies';
      case ApiMediaQueryType.popularActors:
        return 'popular_actors';
    }
  }

  String asAppBarTitle() {
    switch (this) {
      case ApiMediaQueryType.popularMovies:
        return 'Popular movies';
      case ApiMediaQueryType.trendingMovies:
        return 'Trending movies';
      case ApiMediaQueryType.popularSeries:
        return 'Popular TV series';
      case ApiMediaQueryType.nowPlayingMovies:
        return 'Now Playing Movies';
      case ApiMediaQueryType.popularActors:
        return 'Popular people';
    }
  }

  static ApiMediaQueryType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'popular_movies':
        return ApiMediaQueryType.popularMovies;
      case 'trending_movies':
        return ApiMediaQueryType.trendingMovies;
      case 'popular_series':
        return ApiMediaQueryType.popularSeries;
      case 'now_playing_movies':
        return ApiMediaQueryType.nowPlayingMovies;
      case 'popular_actors':
        return ApiMediaQueryType.popularActors;
      default:
        return ApiMediaQueryType.popularMovies;
    }
  }
}

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AllMediaBloc extends Bloc<AllMediaEvent, AllMediaState> {
  late final MediaClient _mediaClient;

  AllMediaBloc({required MediaClient mediaClient})
      : _mediaClient = mediaClient,
        super(AllMediaState()) {
    on<AllMediaLoadNewMediaEvent>(
      _onLoadNewMedia,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  Future<void> _onLoadNewMedia(
    AllMediaLoadNewMediaEvent event,
    Emitter<AllMediaState> emit,
  ) async {
    if (state.hasReachedMax) return;

    List<TMDBModel> models = [];
    switch (event.queryType) {
      case ApiMediaQueryType.popularMovies:
        models = await _mediaClient.getPopularMovies(
          locale: event.locale,
          page: event.page,
        );
        break;
      case ApiMediaQueryType.popularSeries:
        models = await _mediaClient.getPopularSeries(
          locale: event.locale,
          page: event.page,
        );
        break;
      case ApiMediaQueryType.trendingMovies:
        models = await _mediaClient.getTrendingMovies(
          locale: event.locale,
          page: event.page,
        );
        break;
      case ApiMediaQueryType.nowPlayingMovies:
        models = await _mediaClient.getNowPlayingMovies(
          locale: event.locale,
          page: event.page,
        );
      case ApiMediaQueryType.popularActors:
        models = await _mediaClient.getPopularActors(
          locale: event.locale,
          page: event.page,
        );
        break;
    }

    if (state.status == AllMediaStatus.initial) {
      return emit(
        state.copyWith(
          status: AllMediaStatus.success,
          models: models,
          hasReachedMax: false,
        ),
      );
    }
    models.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(
            state.copyWith(
              status: AllMediaStatus.success,
              models: state.models + models,
              hasReachedMax: false,
              page: event.page + 1,
            ),
          );
  }
}
