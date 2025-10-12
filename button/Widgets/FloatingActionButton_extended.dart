import 'package:flutter/material.dart';

class MyFloatingactionButton_extended extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingactionButton_extended({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: Icon(Icons.stars),
      label: Text('New'),
    );
  }
}
