import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/person_details_bloc/person_details_bloc.dart';
import 'package:movies_app/ui/widgets/person_details_widgets/person_details_appbar.dart';
import 'package:movies_app/ui/widgets/person_details_widgets/person_details_body.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({
    super.key,
    required this.personId,
    required this.appBarTitle,
  });

  final int personId;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonDetailsBloc(
          mediaClient: RepositoryProvider.of<MediaClient>(context))
        ..add(PersonDetailsLoadDetailsEvent(personId: personId)),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PersonDetailsAppBar(title: appBarTitle),
        body: PersonDetailsBody(personId: personId),
      ),
    );
  }
}
