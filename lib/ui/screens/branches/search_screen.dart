import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/clients/tmdb_media_client.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app/ui/widgets/search_body.dart';
import 'package:movies_app/ui/widgets/text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        tmdbMediaClient: TMDBMediaClient(),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        extendBodyBehindAppBar: true,
        appBar: const CustomSearchAppBar(),
        body: const SearchBody(),
      ),
    );
  }
}

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFieldWidget(
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                hintText: "Search",
              ),
            ),
          ],
        ),
      ),
    );
  }
  // good work
  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
