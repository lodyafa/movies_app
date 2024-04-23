import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:movies_app/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        tmdbMediaClient: RepositoryProvider.of<MediaClient>(context),
        connectivityCubit: RepositoryProvider.of<ConnectivityCubit>(context),
      )..add(HomeAllMediaEvent()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "The Movie Database",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: const HomeBody(),
      ),
    );
  }
}
