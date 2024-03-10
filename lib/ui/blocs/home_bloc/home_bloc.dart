import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:movies_app/data/api/media_client.dart';
import 'package:movies_app/models/tmdb_models.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  late final MediaClient _tmdbMediaClient;

  HomeBloc({
    required MediaClient tmdbMediaClient,
  })  : _tmdbMediaClient = tmdbMediaClient,
        super(HomeBlocState()) {
    on<HomeAllMediaEvent>(_onAllMedia);
    on<HomePopularMoviesEvent>(_onPopularMovies);
    on<HomePopularTVSeriesEvent>(_onPopularSeries);
    on<HomeTrendingMoviesEvent>(_onTrendingMovies);
    on<HomeNowPlayingMoviesEvent>(_onNowPlayingMovies);
    on<HomePopularPeopleEvent>(_onPopularPeople);
  }

  Future<void> _onAllMedia(
      HomeAllMediaEvent event, Emitter<HomeBlocState> emit) async {
    emit(state.copyWith(isLoading: true));

    final List<MovieModel> popularMovies =
        await _tmdbMediaClient.getPopularMovies(
      locale: event.locale,
      page: event.page,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final List<SeriesModel> popularSeries =
        await _tmdbMediaClient.getPopularSeries(
      locale: event.locale,
      page: event.page,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final List<MovieModel> trendingMovies =
        await _tmdbMediaClient.getTrendingMovies(
      locale: event.locale,
      page: event.page,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final List<MovieModel> nowPlayingMovies =
        await _tmdbMediaClient.getNowPlayingMovies(
      locale: event.locale,
      page: event.page,
    );

    await Future.delayed(const Duration(milliseconds: 200));

    final List<PersonModel> popularPeople =
        await _tmdbMediaClient.getPopularPeople(
      locale: event.locale,
      page: event.page,
    );

    emit(state.copyWith(
      popularMovies: popularMovies,
      popularSeries: popularSeries,
      popularPeople: popularPeople,
      trendingMovies: trendingMovies,
      nowPlayingMovies: nowPlayingMovies,
    ));
  }

  _onPopularMovies(
      HomePopularMoviesEvent event, Emitter<HomeBlocState> emit) async {
    final List<MovieModel> popularMovies =
        await _tmdbMediaClient.getPopularMovies(
      locale: event.locale,
      page: event.page,
    );
    if (popularMovies.isEmpty) return;
    emit(state.copyWith(popularMovies: popularMovies));
  }

  _onPopularSeries(
      HomePopularTVSeriesEvent event, Emitter<HomeBlocState> emit) async {
    final List<SeriesModel> popularSeries =
        await _tmdbMediaClient.getPopularSeries(
      locale: event.locale,
      page: event.page,
    );
    if (popularSeries.isEmpty) return;
    emit(state.copyWith(popularSeries: popularSeries));
  }

  _onTrendingMovies(
      HomeTrendingMoviesEvent event, Emitter<HomeBlocState> emit) async {
    final List<MovieModel> trendingMovies =
        await _tmdbMediaClient.getTrendingMovies(
      locale: event.locale,
      page: event.page,
    );
    if (trendingMovies.isEmpty) return;
    emit(state.copyWith(trendingMovies: trendingMovies));
  }

  _onNowPlayingMovies(
      HomeNowPlayingMoviesEvent event, Emitter<HomeBlocState> emit) async {
    final List<MovieModel> nowPlayingMovies =
        await _tmdbMediaClient.getNowPlayingMovies(
      locale: event.locale,
      page: event.page,
    );
    if (nowPlayingMovies.isEmpty) return;
    emit(state.copyWith(nowPlayingMovies: nowPlayingMovies));
  }

  _onPopularPeople(
      HomePopularPeopleEvent event, Emitter<HomeBlocState> emit) async {
    final List<PersonModel> popularPeople =
        await _tmdbMediaClient.getPopularPeople(
      locale: event.locale,
      page: event.page,
    );
    if (popularPeople.isEmpty) return;
    emit(state.copyWith(popularPeople: popularPeople));
  }
}
