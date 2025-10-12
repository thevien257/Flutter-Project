import 'package:flutter/material.dart';

class Part2Page extends StatelessWidget {
  const Part2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'PART 2 PAGE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('This is the second page content'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
