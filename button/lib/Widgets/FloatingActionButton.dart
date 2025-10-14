import 'package:flutter/material.dart';

class MyFloatingactionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingactionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(Icons.add));
  }
}