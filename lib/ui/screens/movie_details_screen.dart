import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/movie_details_body.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, });

  // final List<MovieModel> media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_outlined),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
      body: const MovieDetailsBody(),
    );
  }
}
