import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String? label;

  const MyIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: color,
            iconSize: 40,
            onPressed: onPressed,
          ),
          Text(label!),
        ],
      );
    } else {
      return IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 40,
        onPressed: onPressed,
      );
    }
  }
}
