import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/themes/theme.dart';

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
          selectedItemColor: Theme.of(context)
              .extension<ThemeColors>()!
              .btmNvgBarActiveIconColor,
          unselectedItemColor:
              Theme.of(context).extension<ThemeColors>()!.btmNvgBarIconColor,
          backgroundColor: Theme.of(context).extension<ThemeColors>()!.btmNvgBarBackgrdColor,
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
            color:
                Theme.of(context).extension<ThemeColors>()!.btmNvgBarIconColor,
          ),
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context)
                .extension<ThemeColors>()!
                .btmNvgBarActiveIconColor,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color:
                Theme.of(context).extension<ThemeColors>()!.btmNvgBarIconColor,
          ),
          activeIcon: Icon(
            Icons.search,
            color: Theme.of(context)
                .extension<ThemeColors>()!
                .btmNvgBarActiveIconColor,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color:
                Theme.of(context).extension<ThemeColors>()!.btmNvgBarIconColor,
          ),
          activeIcon: Icon(
            Icons.person,
            color: Theme.of(context)
                .extension<ThemeColors>()!
                .btmNvgBarActiveIconColor,
          ),
          label: "Account",
        ),
      ];
}
