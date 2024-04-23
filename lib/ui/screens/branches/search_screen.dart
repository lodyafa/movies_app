import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app/ui/widgets/search_widgets/custom_search_appbar.dart';
import 'package:movies_app/ui/widgets/search_widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        tmdbMediaClient: MediaClient(),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        extendBodyBehindAppBar: true,
        appBar: const CustomSearchAppBar(),
        body: const SearchBody(),
      ),
    );
  }
}
