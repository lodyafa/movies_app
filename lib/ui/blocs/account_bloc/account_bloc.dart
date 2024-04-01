import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/data/api/api_clients/session_data_client.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  late final MediaClient _mediaClient;
  late final SessionDataClient _sessionDataClient;

  AccountBloc({
    required MediaClient mediaClient,
    required SessionDataClient sessionDataClient,
  })  : _mediaClient = mediaClient,
        _sessionDataClient = sessionDataClient,
        super(AccountState()) {
    on<AccountLoadAccountDetailsEvent>(_onLoadAccountDetails);
  }

  Future<void> _onLoadAccountDetails(
    AccountLoadAccountDetailsEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountLoadingState());
    try {
      final accountId = await _sessionDataClient.getAccountId();
      final sessionId = await _sessionDataClient.getSessionId();

      if (accountId == null || sessionId == null) {
        return emit(AccountFailureState(
            failure: ApiException(type: ApiExceptionType.unknown)));
      }
      AccountModel accountDetails = await _mediaClient.getAccountDetails(
        accountId: accountId,
        sessionId: sessionId,
      );
      emit(AccountLoadedState(accountDetails: accountDetails));
    } on ApiException catch (exception) {
      emit(AccountFailureState(failure: exception));
    }
  }
}
