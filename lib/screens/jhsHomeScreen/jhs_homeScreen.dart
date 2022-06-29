import 'package:flutter/material.dart';

import '../ScoreBoard/jsh_scoreboard.dart';
import '../Topics/topics_namejhs.dart';

class JhsHomeScreen extends StatefulWidget {
  const JhsHomeScreen({Key? key}) : super(key: key);

  @override
  State<JhsHomeScreen> createState() => JhsHomeScreenState();
}

class JhsHomeScreenState extends State<JhsHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const TopicJhs(),
    const JhsScoreBoard(),
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
