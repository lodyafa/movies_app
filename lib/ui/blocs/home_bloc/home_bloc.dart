import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/cubits/connectivity_cubit/connectivity_cubit.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeState> {
  late final ConnectivityCubit _connectivityCubit;
  late final StreamSubscription _connectivityCubitSubscription;
  late final MediaClient _tmdbMediaClient;

  HomeBloc({
    required ConnectivityCubit connectivityCubit,
    required MediaClient tmdbMediaClient,
  })  : _connectivityCubit = connectivityCubit,
        _tmdbMediaClient = tmdbMediaClient,
        super(HomeState()) {
    Future.microtask(
      () {
        _onConnectivityStateChanged(connectivityCubit.state);
        _connectivityCubitSubscription =
            _connectivityCubit.stream.listen(_onConnectivityStateChanged);
      },
    );

    on<HomeAllMediaEvent>(_onAllMedia, transformer: sequential());
    on<HomeNetworkErrorEvent>(_onNetworkError);
  }

  void _onConnectivityStateChanged(ConnectivityState state) {
    if (state.type == ConnectivityStateType.offline) {
      add(HomeNetworkErrorEvent());
    } else if (state.type == ConnectivityStateType.connected) {
      print("mcnsdjfbsdvbdfjhsv dbvfdb vjv AAAAAAAAAAAA");
      add(HomeAllMediaEvent());
    }
  }

  Future<void> _onAllMedia(
    HomeAllMediaEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeBlocLoadingState());

    final List<MovieModel> popularMovies =
        await _tmdbMediaClient.getPopularMovies(
      locale: event.locale,
      page: event.page,
    );

    final List<SeriesModel> popularSeries =
        await _tmdbMediaClient.getPopularSeries(
      locale: event.locale,
      page: event.page,
    );

    final List<MovieModel> trendingMovies =
        await _tmdbMediaClient.getTrendingMovies(
      locale: event.locale,
      page: event.page,
    );

    final List<MovieModel> nowPlayingMovies =
        await _tmdbMediaClient.getNowPlayingMovies(
      locale: event.locale,
      page: event.page,
    );

    final List<PersonModel> popularPeople =
        await _tmdbMediaClient.getPopularActors(
      locale: event.locale,
      page: event.page,
    );

    emit(HomeLoadedState(
      popularMovies: popularMovies,
      popularSeries: popularSeries,
      popularPeople: popularPeople,
      trendingMovies: trendingMovies,
      nowPlayingMovies: nowPlayingMovies,
    ));
  }

  void _onNetworkError(HomeNetworkErrorEvent event, Emitter<HomeState> emit) {
    emit(HomeFailureState(
      failure: ApiException(type: ApiExceptionType.network),
    ));
  }

  @override
  Future<void> close() {
    _connectivityCubitSubscription.cancel();
    return super.close();
  }
}
