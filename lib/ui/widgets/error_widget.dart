import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.text,
    required this.btnText,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String btnText;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 150,
          ),
          const SizedBox(height: 20),
          Text(text),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: onPressed,
            child: Text(btnText),
          )
        ],
      ),
    );
  }
}
