part of 'account_bloc.dart';

class AccountState {}

final class AccountLoadingState extends AccountState {}

final class AccountLoadedState extends AccountState {
  final AccountModel accountDetails;

  AccountLoadedState({required this.accountDetails});
}

final class AccountFailureState extends AccountState {
  final ApiException failure;

  AccountFailureState({required this.failure});
}
