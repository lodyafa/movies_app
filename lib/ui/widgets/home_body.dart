import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomePopularMoviesEvent("en-US", 1));
                  },
                  child: const Text("movies"),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomePopularTVSeriesEvent("en-US", 1));
                  },
                  child: const Text("series"),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomeTrendingMoviesEvent("en-US", 1));
                  },
                  child: const Text("trending movies"),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomeNowPlayingMoviesEvent("en-US", 1));
                  },
                  child: const Text("now playing"),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(HomePopularPeopleEvent("en-US", 1));
                  },
                  child: const Text("people"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Popular Movies",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                final popularMovies = context.select(
                  (HomeBloc bloc) => bloc.state.popularMovies,
                );
                if (popularMovies.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: MoviesListView(movies: popularMovies),
                );
              },
            ),
            Text(
              "Popular TV Series",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                final popularSeries = context.select(
                  (HomeBloc bloc) => bloc.state.popularSeries,
                );
                if (popularSeries.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: PopularSeriesListView(popularSeries: popularSeries),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Now Playing",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                final nowPlayingMovies = context.select(
                  (HomeBloc bloc) => bloc.state.nowPlayingMovies,
                );
                if (nowPlayingMovies.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: MoviesListView(movies: nowPlayingMovies),
                );
              },
            ),
            Text(
              "Trending Movies",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                final trendingMovies = context.select(
                  (HomeBloc bloc) => bloc.state.trendingMovies,
                );
                if (trendingMovies.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: MoviesListView(movies: trendingMovies),
                );
              },
            ),
            Text(
              "Popular People",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<HomeBloc, HomeBlocState>(
              builder: (context, state) {
                final popularPeople = context.select(
                  (HomeBloc bloc) => bloc.state.popularPeople,
                );
                if (popularPeople.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 256,
                  width: double.infinity,
                  child: PopularPeopleListView(popularPeople: popularPeople),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
