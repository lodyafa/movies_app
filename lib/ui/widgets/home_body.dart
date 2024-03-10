import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, HomeBlocState>(
          builder: (context, state) {
            final state = context.select((HomeBloc bloc) => bloc.state);
            List<MovieModel> popularMovies = state.popularMovies;
            List<MovieModel> trendingMovies = state.trendingMovies;
            List<SeriesModel> popularSeries = state.popularSeries;
            List<PersonModel> popularPeople = state.popularPeople;

            if (state.isLoading) {
              print("Here");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular TV Series",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: MoviesListView(movies: popularMovies),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
