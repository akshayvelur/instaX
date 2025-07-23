import 'package:flutter/material.dart';
import 'package:insta_x/screens/create_account/create_account.dart';
import 'package:insta_x/screens/home_page/home_page.dart';
import 'package:insta_x/screens/posts/post_screen.dart';
import 'package:insta_x/screens/profile/profile.dart';

class BottomNavigate extends StatefulWidget {
  BottomNavigate({super.key});

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  @override
  List<Widget> screen = [
    HomePage(),
   Text("Search"),
PostsScreen(),
    Text("reels"),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,unselectedItemColor: const Color.fromARGB(175, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items:  [
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage(_currentIndex==0?"assets/house.png":"assets/home.png"), size: 30),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage("assets/search.png"), size: 30),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage("assets/add.png"), size: 30),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage("assets/reel.png"), size: 30),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage("assets/user.png"), size: 30),
          ),
        ],
      ),
    );
  }
}
