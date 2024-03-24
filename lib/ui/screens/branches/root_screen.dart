import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MediaClient(),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: _buildBottomNavBarItems(context),
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems(BuildContext context) =>
      [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          activeIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_border,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          activeIcon: Icon(
            Icons.bookmark,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: "Watch List",
        ),
      ];
}
