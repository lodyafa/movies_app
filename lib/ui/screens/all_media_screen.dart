import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/all_media_bloc/all_media_bloc.dart';
import 'package:movies_app/ui/widgets/all_media_widgets/all_media_grid_view.dart';

class AllMediaScreen<T> extends StatelessWidget {
  AllMediaScreen({
    super.key,
    required String queryTypeStr,
  }) : queryType = ApiMediaQueryTypeX.fromString(queryTypeStr);

  final ApiMediaQueryType queryType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllMediaBloc(
        mediaClient: RepositoryProvider.of<MediaClient>(context),
      )..add(AllMediaLoadNewMediaEvent(queryType: queryType)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(queryType.asAppBarTitle()),
          centerTitle: true,
        ),
        body: AllMediaBody(queryType: queryType),
      ),
    );
  }
}
