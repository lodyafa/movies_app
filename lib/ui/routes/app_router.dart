import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/screens/authorization_screen.dart';
import 'package:movies_app/ui/screens/all_media_screen.dart';
import 'package:movies_app/ui/screens/branches/home_screen.dart';
import 'package:movies_app/ui/screens/branches/root_screen.dart';
import 'package:movies_app/ui/screens/branches/search_screen.dart';
import 'package:movies_app/ui/screens/branches/account_acreen.dart';
import 'package:movies_app/ui/screens/movie_details_screen.dart';
import 'package:movies_app/ui/screens/person_details_screen.dart';
import 'package:movies_app/ui/screens/screen_loader.dart';
import 'package:movies_app/ui/screens/series_details_screen.dart';
import 'package:movies_app/ui/screens/unknown_media_screen.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.screenLoader,
    routes: [
      GoRoute(
        path: AppRoutes.screenLoader,
        builder: (context, state) => const ScreenLoader(),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthorizationScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  _movieDetailsRoute,
                  _seriesDetailsRoute,
                  _personDetailsRoute,
                  _unknwonMediaRoute,
                  _allMediaRoute,
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchScreen(),
                routes: [
                  _movieDetailsRoute,
                  _seriesDetailsRoute,
                  _personDetailsRoute,
                  _unknwonMediaRoute,
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.account,
                builder: (context, state) => const AccountScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static final GoRoute _movieDetailsRoute = GoRoute(
    path: "${AppRoutes.movieDetails}/:movie_id",
    redirect: (context, state) {
      final extra = state.extra as List;

      String? redirect;
      if (extra[0] == null || extra[0] <= 0) {
        final String initialPath = _getInitialPath();
        redirect = "$initialPath/${AppRoutes.unknownMedia}";
      }
      return redirect;
    },
    builder: (context, state) {
      final extra = state.extra as List;
      return MovieDetailsScreen(
        movieId: extra[0],
        appBarTitle: extra[1],
      );
    },
    routes: [
      _personDetailsRoute,
    ],
  );

  static final GoRoute _seriesDetailsRoute = GoRoute(
    path: "${AppRoutes.seriesDetails}/:series_id",
    redirect: (context, state) {
      final extra = state.extra as List;

      String? redirect;
      if (extra[0] == null || extra[0] <= 0) {
        final String initialPath = _getInitialPath();
        redirect = "$initialPath/${AppRoutes.unknownMedia}";
      }
      return redirect;
    },
    builder: (context, state) {
      final extra = state.extra as List;
      return SeriesDetailsScreen(
        seriesId: extra[0],
        appBarTitle: extra[1],
      );
    },
    routes: [
      _personDetailsRoute,
    ],
  );

  static final GoRoute _personDetailsRoute = GoRoute(
    path: "${AppRoutes.personDetails}/:person_id",
    redirect: (context, state) {
      final extra = state.extra as List;

      String? redirect;
      if (extra[0] == null || extra[0] <= 0) {
        final String initialPath = _getInitialPath();
        redirect = "$initialPath/${AppRoutes.unknownMedia}";
      }
      return redirect;
    },
    builder: (context, state) {
      final extra = state.extra as List;
      return PersonDetailsScreen(
        personId: extra[0],
        appBarTitle: extra[1],
      );
    },
  );

  static final GoRoute _allMediaRoute = GoRoute(
    path: AppRoutes.allMedia,
    builder: (context, state) {
      final extra = state.extra as String;
      return AllMediaScreen(
        queryTypeStr: extra,
      );
    },
    routes: [
      _movieDetailsRoute,
      _seriesDetailsRoute,
      _personDetailsRoute,
      _unknwonMediaRoute,
    ],
  );

  static final GoRoute _unknwonMediaRoute = GoRoute(
    path: AppRoutes.unknownMedia,
    builder: (context, state) => const UnknownMediaScreen(),
  );

  static String _getInitialPath() {
    final String curUri = _router.routeInformationProvider.value.uri.toString();
    final String initialPath;
    if (curUri.contains("home")) {
      initialPath = AppRoutes.home;
    } else if (curUri.contains("search")) {
      initialPath = AppRoutes.search;
    } else {
      initialPath = AppRoutes.account;
    }
    return initialPath;
  }

  static GoRouter get router => _router;
}
