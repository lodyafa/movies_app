import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/all_media_bloc/all_media_bloc.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';
import 'package:movies_app/ui/widgets/home_category_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFailureState) {
          switch (state.failure.type) {
            case (ApiExceptionType.network):
              return CustomErrorWidget(
                text: "Check your internet connection",
                icon: Icons.wifi_off,
                btnText: "Update",
                onPressed: () {},
              );
            case (ApiExceptionType.sessionExpired):
              return CustomErrorWidget(
                text: "Session Expired",
                icon: Icons.exit_to_app,
                btnText: "Login",
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutEvent());
                  context.go(AppRoutes.screenLoader);
                },
              );
            default:
              return CustomErrorWidget(
                text: "Something went wrong...",
                icon: Icons.error,
                btnText: "Update",
                onPressed: () {},
              );
          }
        }

        if (state is HomeBlocLoadingState) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Loading media"),
                SizedBox(height: 10),
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (state is HomeLoadedState) {
          return ListView(
            padding: const EdgeInsets.only(left: 16),
            children: [
              HomeCategoryList<MovieModel>(
                cardHeight: 210,
                cardWidth: 140,
                title: "Popular Movies",
                media: state.popularMovies,
                onPressedAllMediaBtn: () {
                  context.push(
                    "${AppRoutes.home}/${AppRoutes.allMedia}",
                    extra: ApiMediaQueryType.popularMovies.asString(),
                  );
                },
              ),
              const SizedBox(height: 10),
              HomeCategoryList<MovieModel>(
                cardHeight: 210,
                cardWidth: 140,
                title: "Trending Movies",
                media: state.trendingMovies,
                onPressedAllMediaBtn: () {
                  context.push(
                    "${AppRoutes.home}/${AppRoutes.allMedia}",
                    extra: ApiMediaQueryType.trendingMovies.asString(),
                  );
                },
              ),
              const SizedBox(height: 10),
              HomeCategoryList<SeriesModel>(
                cardHeight: 210,
                cardWidth: 140,
                title: "Popular TV Series",
                media: state.popularSeries,
                onPressedAllMediaBtn: () {
                  context.push(
                    "${AppRoutes.home}/${AppRoutes.allMedia}",
                    extra: ApiMediaQueryType.popularSeries.asString(),
                  );
                },
              ),
              const SizedBox(height: 10),
              HomeCategoryList<MovieModel>(
                cardHeight: 210,
                cardWidth: 140,
                title: "Now playing",
                media: state.nowPlayingMovies,
                onPressedAllMediaBtn: () {
                  context.push(
                    "${AppRoutes.home}/${AppRoutes.allMedia}",
                    extra: ApiMediaQueryType.nowPlayingMovies.asString(),
                  );
                },
              ),
              const SizedBox(height: 10),
              HomeCategoryList<PersonModel>(
                cardHeight: 210,
                cardWidth: 140,
                title: "Popular people",
                media: state.popularPeople,
                onPressedAllMediaBtn: () {
                  context.push(
                    "${AppRoutes.home}/${AppRoutes.allMedia}",
                    extra: ApiMediaQueryType.popularActors.asString(),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        }

        return CustomErrorWidget(
          text: "Something went wrong...",
          icon: Icons.error,
          btnText: "Update",
          onPressed: () {},
        );
      },
    );
  }
}
