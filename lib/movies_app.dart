import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_app/data/api/clients/account_client.dart';
import 'package:movies_app/data/api/clients/auth_client.dart';
import 'package:movies_app/data/api/clients/session_data_client.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/routes/app_router.dart';
import 'package:movies_app/ui/themes/theme.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthClient(),
        ),
        RepositoryProvider(
          create: (context) => AccountClient(),
        ),
        RepositoryProvider(
          create: (context) => SessionDataClient(
            secureStorage: const FlutterSecureStorage(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authClient: RepositoryProvider.of<AuthClient>(context),
              accountClient: RepositoryProvider.of<AccountClient>(context),
              sessionDataClient:
                  RepositoryProvider.of<SessionDataClient>(context),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          darkTheme: createDarkTheme(),
          themeMode: ThemeMode.dark,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
