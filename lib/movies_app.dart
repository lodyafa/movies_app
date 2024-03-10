import 'package:flutter/material.dart';
import 'package:movies_app/ui/routes/app_router.dart';
import 'package:movies_app/ui/themes/theme.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData.light(),
      darkTheme: createDarkTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
