import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/series_details_bloc/series_details_bloc.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_details_appbar.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_details_body.dart';

class SeriesDetailsScreen extends StatelessWidget {
  const SeriesDetailsScreen({
    super.key,
    required this.seriesId,
    required this.appBarTitle,
  });

  final int seriesId;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesDetailsBloc(
          mediaClient: RepositoryProvider.of<MediaClient>(context))
        ..add(SeriesDetailsLoadDetailsEvent(seriesId: seriesId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SeriesDetailsAppBar(title: appBarTitle),
        body: SeriesDetailsBody(seriesId: seriesId),
      ),
    );
  }
}
