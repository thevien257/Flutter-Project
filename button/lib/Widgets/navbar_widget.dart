import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onDestinationSelected;

  const NavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Part 1"),
        NavigationDestination(icon: Icon(Icons.home_work), label: "Part 2"),
      ],
      onDestinationSelected: onDestinationSelected,
      selectedIndex: currentIndex,
    );
  }
}
