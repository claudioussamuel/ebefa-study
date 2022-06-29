import 'package:ebefastudy/screens/Topics/topics_name.dart';
import 'package:flutter/material.dart';

import '../ScoreBoard/shs_scoreboard.dart';

class ShsHomeScreen extends StatefulWidget {
  const ShsHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShsHomeScreen> createState() => _ShsHomeScreenState();
}

class _ShsHomeScreenState extends State<ShsHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TopicShs(),
    ShsScoreBoard(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.lightGreenAccent,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.book_rounded, "Pasco"),
            _bottomNavItem(Icons.emoji_events_outlined, "ScoreBoard"),
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: Colors.grey[300],
        ),
        activeIcon: Icon(icon, color: Colors.grey[300]),
        label: label);
  }

  void onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
