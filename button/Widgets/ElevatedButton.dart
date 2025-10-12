import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MyElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
