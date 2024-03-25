import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

part 'series_details_event.dart';
part 'series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  late final MediaClient _mediaClient;

  SeriesDetailsBloc({required MediaClient mediaClient})
      : _mediaClient = mediaClient,
        super(SeriesDetailsState()) {
    on<SeriesDetailsLoadDetailsEvent>(_onLoadSeriesDetails);
  }

  Future<void> _onLoadSeriesDetails(
    SeriesDetailsLoadDetailsEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    emit(SeriesDetailsLoadingState());
    try {
      SeriesModel seriesDetails = await _mediaClient.getSeriesDetails(
        seriesId: event.seriesId,
        locale: event.locale,
      );
      List<PersonModel> seriesActors = await _mediaClient.getSeriesActors(
        seriesId: event.seriesId,
        locale: event.locale,
      );
      emit(SeriesDetailsLoadedState(
        seriesDetails: seriesDetails,
        seriesActors: seriesActors,
      ));
    } on ApiException catch (exception) {
      emit(SeriesDetailsFailureState(failure: exception));
    }
  }
}
