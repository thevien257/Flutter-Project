import 'package:button/Widgets/navbar_widget.dart';
import 'package:button/Widgets/FloatingActionButton_large.dart';
import 'package:button/Widgets/FloatingActionButton_small.dart';
import 'package:button/Widgets/FloatingActionButton.dart';
import 'package:button/Widgets/FloatingActionButton_extended.dart';
import 'package:button/pages/part1_page.dart';
import 'package:button/pages/part2_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyFullApp());
}

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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    bool isValid = true;
    setState(() {
      if (_nameController.text.isEmpty) {
        _nameError = 'Please enter your name';
        isValid = false;
      } else if (_nameController.text.length < 3) {
        _nameError = 'Name must be at least 3 characters';
        isValid = false;
      } else {
        _nameError = null;
      }

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

  // Danh sách các trang
  List<Widget> get _pages => [
    Part1Page(
      nameController: _nameController,
      emailController: _emailController,
      nameError: _nameError,
      emailError: _emailError,
      likeCount: _likeCount,
      onSubmit: _submitForm,
      onLearnMore: () {
        setState(() {
          _result = '📋 Learn More clicked';
        });
      },
      onClear: _clearForm,
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
    ),
    Part2Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 0,
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
              : Text("Flutter Vien"),
          centerTitle: true,
        ),
        body: _pages[currentIndex],
        bottomNavigationBar: NavBarWidget(
          currentIndex: currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        floatingActionButton: currentIndex == 0
            ? Column(
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
              )
            : null,
      ),
    );
  }
}
