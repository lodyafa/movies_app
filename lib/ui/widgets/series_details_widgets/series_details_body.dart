import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/blocs/series_deatils_bloc/series_details_bloc.dart';
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
                onPressed: () {},
              );
          }
        }

        if (state is SeriesDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SeriesDetailsLoadedState) {
          return SeriesDetailsLoadedBody(
            series: state.seriesDetails,
            seriesActors: state.seriesActors,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
