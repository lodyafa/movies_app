import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        tmdbMediaClient: RepositoryProvider.of<MediaClient>(context),
      )..add(HomeAllMediaEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "Movies App",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
        body: const HomeBody(),
      ),
    );
  }
}
