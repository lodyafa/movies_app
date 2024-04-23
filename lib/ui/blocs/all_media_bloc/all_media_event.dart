part of 'all_media_bloc.dart';

class AllMediaEvent {}

class AllMediaLoadNewMediaEvent extends AllMediaEvent {
  final int page;
  final ApiMediaQueryType queryType;
  final String locale;

  AllMediaLoadNewMediaEvent({
    this.page = 1,
    required this.queryType,
    this.locale = "en-US",
  });
}
