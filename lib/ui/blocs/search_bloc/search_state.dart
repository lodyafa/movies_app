part of 'search_bloc.dart';

class SearchState {
  final List<TMDBModel> searchMedia;
  final bool isLoading;

  SearchState({
    this.searchMedia = const [],
    this.isLoading = false,
  });

  SearchState copyWith({
    List<TMDBModel>? searchMedia,
    bool isLoading = false,
  }) {
    return SearchState(
      searchMedia: searchMedia ?? this.searchMedia,
      isLoading: isLoading,
    );
  }
}
