import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/blocs/all_media_bloc/all_media_bloc.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/widgets/all_media_widgets/all_media_loaded_body.dart';
import 'package:movies_app/ui/widgets/error_widget.dart';

class AllMediaBody extends StatelessWidget {
  const AllMediaBody({
    super.key,
    required this.queryType,
  });

  final ApiMediaQueryType queryType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMediaBloc, AllMediaState>(
      builder: (context, state) {
        switch (state.status) {
          case AllMediaStatus.failure:
            return CustomErrorWidget(
              text: "Something went wrong...",
              icon: Icons.error,
              btnText: "Update",
              onPressed: () =>
                  context.read<HomeBloc>().add(HomeAllMediaEvent()),
            );
          case AllMediaStatus.success:
            final screenWidth = MediaQuery.of(context).size.width;
            final totalPadding = screenWidth - (180 * 2);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: totalPadding / 3),
              child: AllMediaLoadedBody(
                models: state.models,
                page: state.page,
                queryType: queryType,
                hasReachedMax: state.hasReachedMax,
              ),
            );
          case AllMediaStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
