import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app/ui/themes/theme.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        context.read<SearchBloc>().add(
              LoadSearchMediaEvent(query: query),
            );
      },
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      
      decoration: InputDecoration(
        fillColor: Theme.of(context).extension<ThemeColors>()!.searchAppBarColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsetsDirectional.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
