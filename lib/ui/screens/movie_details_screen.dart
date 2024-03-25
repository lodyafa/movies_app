import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_details_appbar.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_details_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movieId,
    required this.appBarTitle,
  });

  final int movieId;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
          mediaClient: RepositoryProvider.of<MediaClient>(context))
        ..add(MovieDetailsLoadDetailsEvent(movieId: movieId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MovieDetailsAppBar(title: appBarTitle),
        body: MovieDetailsBody(movieId: movieId),
      ),
    );
  }
}
