import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/screens/authorization_screen.dart';
import 'package:movies_app/ui/screens/branches/home_screen.dart';
import 'package:movies_app/ui/screens/branches/root_screen.dart';
import 'package:movies_app/ui/screens/branches/search_screen.dart';
import 'package:movies_app/ui/screens/branches/watch_list_screen.dart';
import 'package:movies_app/ui/screens/movie_details_screen.dart';
import 'package:movies_app/ui/screens/screen_loader.dart';
import 'package:movies_app/ui/screens/series_details_screen.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
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
                  GoRoute(
                    path: AppRoutes.movieDetails,
                    builder: (context, state) {
                      final extra = state.extra as List;
                      return MovieDetailsScreen(
                        movieId: extra[0],
                        appBarTitle: extra[1],
                      );
                    },
                  )
                ],
              ),
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutes.seriesDetails,
                    builder: (context, state) {
                      final extra = state.extra as List;
                      return SeriesDetailsScreen(
                        seriesId: extra[0],
                        appBarTitle: extra[1],
                      );
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.watchList,
                builder: (context, state) => const WatchListScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
