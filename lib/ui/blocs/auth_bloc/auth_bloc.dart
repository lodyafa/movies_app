import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:movies_app/data/api/api_clients/account_client.dart';
import 'package:movies_app/data/api/api_clients/auth_client.dart';
import 'package:movies_app/data/api/api_clients/session_data_client.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final SessionDataClient _sessionDataClient;
  late final AuthClient _authClient;
  late final AccountClient _accountClient;

  AuthBloc({
    required SessionDataClient sessionDataClient,
    required AuthClient authClient,
    required AccountClient accountClient,
  })  : _sessionDataClient = sessionDataClient,
        _authClient = authClient,
        _accountClient = accountClient,
        super(AuthState()) {
    on<AuthEvent>(
      _eventHandlerSwitcher,
      transformer: sequential(),
    );
    // add(AuthLogoutEvent());
  }

  Future<void> _eventHandlerSwitcher(
      AuthEvent event, Emitter<AuthState> emit) async {
    if (event is AuthCheckStatusEvent) {
      await _onAuthCheckStatus(event, emit);
    } else if (event is AuthLoginEvent) {
      await _onAuthLogin(event, emit);
    } else if (event is AuthLogoutEvent) {
      await _onAuthLogout(event, emit);
    }
  }

  Future<void> _onAuthCheckStatus(
      AuthCheckStatusEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthStatusCheckInProgressState());
      final sessionId = await _sessionDataClient.getSessionId();
      final newState =
          sessionId != null ? AuthAuthorizedState() : AuthUnauthorizedState();
      emit(newState);
    } catch (err) {
      emit(AuthFailureState(err));
    }
  }

  Future<void> _onAuthLogin(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthInProgressState());
      final sessionId = await _authClient.auth(
        login: event.login,
        password: event.password,
      );
      final accountId = await _accountClient.getAccountId(sessionId: sessionId);
      await _sessionDataClient.setAccountId(accountId: accountId);
      await _sessionDataClient.setSessionId(sessionId: sessionId);
      emit(AuthAuthorizedState());
    } catch (err) {
      emit(AuthFailureState(err));
    }
  }

  Future<void> _onAuthLogout(
      AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await _sessionDataClient.deleteSessionId();
      await _sessionDataClient.deleteAccountId();
    } catch (err) {
      emit(AuthFailureState(err));
    }
  }
}
