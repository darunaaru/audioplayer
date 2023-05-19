import 'package:audioplayer/home_screen.dart';
import 'package:audioplayer/search_screen.dart';
import 'package:flutter/material.dart';



class bottomnavigation extends StatefulWidget {
  @override
  _bottomnavigationState createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    AudioPlayerPage(),
    SearchScreen(),
    Music(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {

            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,

            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,

            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,

            icon: Icon(Icons.music_note_rounded),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,

            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Music Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
