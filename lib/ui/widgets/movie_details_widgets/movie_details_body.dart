import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';
import 'package:movies_app/ui/widgets/movie_details_widgets/movie_details_loaded_body.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsFailureState) {
          switch (state.failure.type) {
            case (ApiExceptionType.network):
              return CustomErrorWidget(
                text: "Check your internet connection",
                icon: Icons.wifi_off,
                btnText: "Update",
                onPressed: () => context.read<MovieDetailsBloc>().add(
                      MovieDetailsLoadDetailsEvent(
                        movieId: movieId,
                      ),
                    ),
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
                onPressed: () =>
                    context.read<HomeBloc>().add(HomeAllMediaEvent()),
              );
          }
        }

        if (state is MovieDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieDetailsLoadedState) {
          if (state.movieDetails.posterPath != null) {
            return MovieDetailsLoadedBody(
              movie: state.movieDetails,
              movieActors: state.movieActors,
              movies: state.similarMovies ?? [],
            );
          }
          return Animate(
            effects: const [ShakeEffect()],
            child: const Center(
              child: Text("Movie information not found..."),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
