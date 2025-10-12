import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final String? nameError;
  final String? emailError;

  const MyTextField({
    super.key,
    required this.nameController,
    required this.emailController,
    this.nameError,
    this.emailError,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TEXT INPUT',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                errorText: nameError,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@email.com',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                errorText: emailError,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
