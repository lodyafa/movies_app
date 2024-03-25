import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/blocs/search_bloc/search_bloc.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    this.iconButton,
    required this.hintText,
  });

  final IconButton? iconButton;
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
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.secondary,
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
        suffixIcon: iconButton,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
