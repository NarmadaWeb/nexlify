import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      selectedItemColor: const Color(0xffec1313),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Coming Soon',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
