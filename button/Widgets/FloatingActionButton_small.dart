import 'package:flutter/material.dart';

class MyFloatingactionButton_small extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingactionButton_small({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
