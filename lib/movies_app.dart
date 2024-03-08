import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/clients/tmdb_media_client.dart';
import 'package:movies_app/ui/blocs/home_bloc/home_bloc.dart';
import 'package:movies_app/ui/routes/app_router.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            tmdbMediaClient: TMDBMediaClient(),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFEC612A),
            primary: const Color(0xFFEC612A),
            onPrimary: const Color(0xFFFFFFFF),
            secondary: const Color(0xFF262626),
            onSecondary: const Color(0xFF939393),
            background: const Color(0xFF000000),
            surface: const Color(0xFF121212),
          ),
          textTheme: ThemeData().textTheme.copyWith(),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}

class ThemeClass {
  static ThemeData darkTheme = ThemeData();
}
