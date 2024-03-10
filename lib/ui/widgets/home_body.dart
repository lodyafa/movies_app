import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/widgets/home_category_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: BlocBuilder<HomeBloc, HomeBlocState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Loading media for you <3"),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          return ListView(
            children: [
              HomeCategoryList<SeriesModel>(
                title: "Popular TV Series",
                media: state.popularSeries,
              ),
              const SizedBox(height: 10),
              HomeCategoryList<MovieModel>(
                title: "Popular movies",
                media: state.popularMovies,
              ),
              const SizedBox(height: 10),
              HomeCategoryList<MovieModel>(
                title: "Now playing",
                media: state.nowPlayingMovies,
              ),
              const SizedBox(height: 10),
              HomeCategoryList<PersonModel>(
                title: "Popular people",
                media: state.popularPeople,
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
