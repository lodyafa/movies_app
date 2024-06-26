import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/blocs/series_details_bloc/series_details_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_details_loaded_body.dart';

class SeriesDetailsBody extends StatelessWidget {
  const SeriesDetailsBody({
    super.key,
    required this.seriesId,
  });

  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        if (state is SeriesDetailsFailureState) {
          switch (state.failure.type) {
            case (ApiExceptionType.network):
              return CustomErrorWidget(
                text: "Check your internet connection",
                icon: Icons.wifi_off,
                btnText: "Update",
                onPressed: () => context.read<SeriesDetailsBloc>().add(
                      SeriesDetailsLoadDetailsEvent(
                        seriesId: seriesId,
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
                onPressed: () => context.read<HomeBloc>().add(
                      HomeAllMediaEvent(),
                    ),
              );
          }
        }

        if (state is SeriesDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SeriesDetailsLoadedState) {
          if (state.seriesDetails.posterPath != null) {
            return SeriesDetailsLoadedBody(
              series: state.seriesDetails,
              seriesActors: state.seriesActors,
              seriesList: state.similarSeries ?? [],
            );
          } else {
            return Animate(
              effects: const [ShakeEffect()],
              child: const Center(
                child: Text("Information about the series was not found..."),
              ),
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
