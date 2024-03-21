import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.iconButton,
    required this.hintText,
    required this.controller,
  });

  final TextEditingController controller;
  final IconButton? iconButton;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (query) {},
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
      ),
    );
  }
}
