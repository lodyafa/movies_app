import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<TMDBModel> media = state.searchMedia;
          return SearchMediaList(media: media);
        },
      ),
    );
  }
}


