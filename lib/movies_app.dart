import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movies_app/data/api/api_clients/account_client.dart';
import 'package:movies_app/data/api/api_clients/auth_client.dart';
import 'package:movies_app/data/api/api_clients/session_data_client.dart';
import 'package:movies_app/data/clients/connectivity_client.dart';
import 'package:movies_app/data/storage/shared_prefs.dart';
import 'package:movies_app/ui/blocs/auth_bloc/auth_bloc.dart';
import 'package:movies_app/ui/blocs/theme_bloc/theme_bloc.dart';
import 'package:movies_app/ui/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:movies_app/ui/routes/app_router.dart';
import 'package:movies_app/ui/themes/theme.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({
    super.key,
    required this.storage,
  });

  final SharedPrefsStorage storage;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ConnectivityClient(
            connectivity: Connectivity(),
          ),
        ),
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
            create: (context) => ThemeBloc(
              storage: storage,
            )..add(ThemeRestoreThemeEvent()),
          ),
          BlocProvider(
            create: (context) => ConnectivityCubit(
              connectivityClient:
                  RepositoryProvider.of<ConnectivityClient>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authClient: RepositoryProvider.of<AuthClient>(context),
              accountClient: RepositoryProvider.of<AccountClient>(context),
              sessionDataClient:
                  RepositoryProvider.of<SessionDataClient>(context),
            ),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: createLightTheme(),
              darkTheme: createDarkTheme(),
              themeMode: state.themeMode,
            );
          },
        ),
      ),
    );
  }
}
