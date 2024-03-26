part of 'person_details_bloc.dart';

class PersonDetailsState {}

final class PersonDetailsLoadingState extends PersonDetailsState {}

final class PersonDetailsLoadedState extends PersonDetailsState {
  final PersonModel personDetails;

  PersonDetailsLoadedState({required this.personDetails});
}

final class PersonDetailsFailureState extends PersonDetailsState {
  final ApiException failure;

  PersonDetailsFailureState({required this.failure});
}
