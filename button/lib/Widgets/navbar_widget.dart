import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Part 1"),
        NavigationDestination(icon: Icon(Icons.home_work), label: "Part 2"),
      ],
      onDestinationSelected: (int value) {
        print(value);
        setState(() {
          currentIndex = value;
        });
      },
      selectedIndex: currentIndex,
    );
  }
}
