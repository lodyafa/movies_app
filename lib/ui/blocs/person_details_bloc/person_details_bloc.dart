import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  late final MediaClient _mediaClient;
  PersonDetailsBloc({required MediaClient mediaClient})
      : _mediaClient = mediaClient,
        super(PersonDetailsState()) {
    on<PersonDetailsLoadDetailsEvent>(_onLoadPersonDetails);
  }

  Future<void> _onLoadPersonDetails(
    PersonDetailsLoadDetailsEvent event,
    Emitter<PersonDetailsState> emit,
  ) async {
    emit(PersonDetailsLoadingState());
    try {
      PersonModel personDetails = await _mediaClient.getPersonDetails(
        personId: event.personId,
        locale: event.locale,
      );

      emit(PersonDetailsLoadedState(
        personDetails: personDetails,
      ));
    } on ApiException catch (exception) {
      emit(PersonDetailsFailureState(failure: exception));
    }
  }
}
