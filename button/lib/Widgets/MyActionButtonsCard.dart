import 'package:flutter/material.dart';
import 'ElevatedButton.dart';
import 'MyOutlinedButton.dart';
import 'MyTextButton.dart';

class MyActionButtonsCard extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onLearnMore;
  final VoidCallback onClear;

  const MyActionButtonsCard({
    super.key,
    required this.onSubmit,
    required this.onLearnMore,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACTION BUTTONS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            MyElevatedButton(onPressed: onSubmit, text: 'SUBMIT'),
            SizedBox(height: 12),
            MyOutlinedButton(onPressed: onLearnMore, text: 'LEARN MORE'),
            SizedBox(height: 12),
            MyTextButton(onPressed: onClear, text: 'CLEAR'),
          ],
        ),
      ),
    );
  }
}
