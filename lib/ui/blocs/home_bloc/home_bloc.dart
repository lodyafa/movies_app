import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:movies_app/data/clients/tmdb_media_client.dart';
import 'package:movies_app/models/tmdb_models.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc({
    required TMDBMediaClient tmdbMediaClient,
  })  : _tmdbMediaClient = tmdbMediaClient,
        super(HomeBlocState()) {
    on<HomePopularMoviesEvent>(_onPopularMovies);
    on<HomePopularTVSeriesEvent>(_onPopularSeries);
    on<HomeTrendingMoviesEvent>(_onTrendingMovies);
    on<HomeNowPlayingMoviesEvent>(_onNowPlayingMovies);
    on<HomePopularPeopleEvent>(_onPopularPeople);
  }

  late final TMDBMediaClient _tmdbMediaClient;

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
