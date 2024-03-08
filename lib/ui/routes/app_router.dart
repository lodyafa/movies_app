import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/screens/branches/home_screen.dart';
import 'package:movies_app/ui/screens/branches/root_screen.dart';
import 'package:movies_app/ui/screens/branches/search_screen.dart';
import 'package:movies_app/ui/screens/branches/watch_list_screen.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
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
