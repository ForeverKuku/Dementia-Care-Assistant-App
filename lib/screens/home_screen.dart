import 'package:dementia_care_app/pages/game_page.dart';
import 'package:dementia_care_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import '../home_pages/dashboard.dart';
import '../pages/book_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Dashboard(),
    BookPage(),
    const ProfilePage(),
    const GamePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigationBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
              backgroundColor: Color.fromARGB(255, 160, 10, 10),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online_outlined),
              label: 'Book',
              backgroundColor: Color.fromARGB(255, 160, 10, 10),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color.fromARGB(255, 160, 10, 10),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Game',
              backgroundColor: Color.fromARGB(255, 160, 10, 10),
            ),
          ]),
    );
  }
}
