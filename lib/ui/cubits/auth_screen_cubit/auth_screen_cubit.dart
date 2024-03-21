import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _authBlocSubscription;

  AuthScreenCubit({
    required AuthScreenState initialState,
    required AuthBloc authBloc,
  })  : _authBloc = authBloc,
        super(initialState) {
    _onState(authBloc.state);
    _authBlocSubscription = authBloc.stream.listen(_onState);
  }

  onAuth({required String login, required String password}) {
    if (!_inputDataValidation(login, password)) {
      final state = AuthScreenErrorState('Заполните логин и/или пароль');
      emit(state);
      return;
    }
    _authBloc.add(AuthLoginEvent(login: login, password: password));
  }

  void _onState(AuthState state) {
    if (state is AuthUnauthorizedState) {
      emit(AuthScreenFormFillInProgressState());
    } else if (state is AuthAuthorizedState) {
      _authBlocSubscription.cancel();
      emit(AuthScreenSuccessState());
    } else if (state is AuthFailureState) {
      final message = _mapErrorToMessage(state.error);
      emit(AuthScreenErrorState(message));
    } else if (state is AuthInProgressState) {
      emit(AuthScreenAuthInProgressState());
    } else if (state is AuthStatusCheckInProgressState) {
      emit(AuthScreenAuthInProgressState());
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is! ApiException) {
      return 'Неизвестная ошибка, поторите попытку...';
    }
    switch (error.type) {
      case ApiExceptionType.network:
        return 'Сервер недоступен. Проверьте подключение к интернету';
      case ApiExceptionType.auth:
        return 'Неверный логин и/или пароль!';
      case ApiExceptionType.sessionExpired:
      case ApiExceptionType.unknown:
        return 'Произошла ошибка. Попробуйте ещё раз...';
    }
  }

  bool _inputDataValidation(String login, String password) =>
      login.trim().isNotEmpty && password.trim().isNotEmpty;

  @override
  Future<void> close() {
    _authBlocSubscription.cancel();
    return super.close();
  }
}