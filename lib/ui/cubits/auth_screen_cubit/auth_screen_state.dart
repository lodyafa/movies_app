part of 'auth_screen_cubit.dart';

class AuthScreenState {}

class AuthScreenFormFillInProgressState extends AuthScreenState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthScreenFormFillInProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthScreenErrorState extends AuthScreenState {
  final String errorMessage;

  AuthScreenErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthScreenErrorState &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}

class AuthScreenAuthInProgressState extends AuthScreenState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthScreenAuthInProgressState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthScreenSuccessState extends AuthScreenState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthScreenSuccessState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
