import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_clients/media_client.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app/ui/widgets/search_body.dart';
import 'package:movies_app/ui/widgets/search_text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        tmdbMediaClient: MediaClient(),
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
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SearchTextFieldWidget(
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune,
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

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
