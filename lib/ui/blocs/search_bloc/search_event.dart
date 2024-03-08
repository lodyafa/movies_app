part of 'search_bloc.dart';

class SearchEvent {}

class LoadSearchMediaEvent extends SearchEvent {
  final String query;
  final String locale;
  final int page;

  LoadSearchMediaEvent({
    required this.query,
    this.locale = "en-US",
    this.page = 1,
  });
}
