import 'package:flutter/material.dart';

class MyFloatingactionButton_large extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingactionButton_large({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
