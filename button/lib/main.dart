import 'package:button/Widgets/navbar_widget.dart';
import 'package:button/Widgets/FloatingActionButton_large.dart';
import 'package:button/Widgets/FloatingActionButton_small.dart';
import 'package:button/Widgets/FloatingActionButton.dart';
import 'package:button/Widgets/FloatingActionButton_extended.dart';
import 'package:button/Widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:button/Widgets/ElevatedButton.dart';
import 'package:button/Widgets/MyActionButtonsCard.dart';
import 'package:button/Widgets/MyIconButtonsCard.dart';

void main() {
  runApp(const MyFullApp());
}

// Stateless widget: means the screen will not change
// Stateful: Can refresh
// Stateless: Can't refresh
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }

class MyFullApp extends StatefulWidget {
  const MyFullApp({super.key});

  @override
  State<MyFullApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyFullApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  int _likeCount = 0;
  int currentIndex = 0;
  String _result = '';
  String? _nameError;
  String? _emailError;

  bool _validateForm() {
    bool isValid = true;
    setState(() {
      // Validate name
      if (_nameController.text.isEmpty) {
        _nameError = 'Please enter your name';
        isValid = false;
      } else if (_nameController.text.length < 3) {
        _nameError = 'Name must be at least 3 characters';
        isValid = false;
      } else {
        _nameError = null;
      }

      // Validate email
      if (_emailController.text.isEmpty) {
        _emailError = 'Please enter your email';
        isValid = false;
      } else if (!_emailController.text.contains('@gmail.com')) {
        _emailError = 'Please enter a valid email';
        isValid = false;
      } else {
        _emailError = null;
      }
    });
    return isValid;
  }

  void _submitForm() {
    if (_validateForm()) {
      setState(() {
        _result =
            '✅ Welcome, ${_nameController.text}!\nEmail: ${_emailController.text}';
      });
    } else {
      setState(() {
        _result = '⚠️ Please fix the errors';
      });
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    setState(() {
      _result = '';
      _likeCount = 0;
      _nameError = null;
      _emailError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: _result.isNotEmpty
              ? Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    _result,
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                )
              : Text(""),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              MyTextField(
                nameController: _nameController,
                emailController: _emailController,
                nameError: _nameError,
                emailError: _emailError,
              ),
              SizedBox(height: 20),
              MyActionButtonsCard(
                onSubmit: _submitForm,
                onLearnMore: () {
                  setState(() {
                    _result = '📋 Learn More clicked';
                  });
                },
                onClear: _clearForm,
              ),
              SizedBox(height: 20),
              MyIconButtonsCard(
                likeCount: _likeCount,
                onLike: () {
                  setState(() {
                    _likeCount++;
                    _result = '❤️ Liked! ($_likeCount)';
                  });
                },
                onShare: () {
                  setState(() {
                    _result = '📤 Share clicked';
                  });
                },
                onBookmark: () {
                  setState(() {
                    _result = '🔖 Bookmark clicked';
                  });
                },
                onComment: () {
                  setState(() {
                    _result = '💬 Comment clicked';
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavBarWidget(),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyFloatingactionButton_small(
              onPressed: () {
                setState(() {
                  _result = '✅ Small FAB clicked';
                });
              },
            ),
            SizedBox(height: 15.0),
            MyFloatingactionButton(
              onPressed: () {
                setState(() {
                  _result = '✅ Standard FAB clicked';
                });
              },
            ),
            SizedBox(height: 15.0),
            MyFloatingactionButton_large(
              onPressed: () {
                setState(() {
                  _result = '✅ Large FAB clicked';
                });
              },
            ),
            SizedBox(height: 15.0),
            MyFloatingactionButton_extended(
              onPressed: () {
                setState(() {
                  _result = '✅ Extended FAB clicked';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
