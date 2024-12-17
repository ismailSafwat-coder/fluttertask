import 'package:flutter/material.dart';
import 'package:task1/categorypage.dart';
import 'package:task1/mainpage.dart';
import 'package:task1/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentidex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Mainpage(),
      const Categorypage(),
      const Profilepage()
    ];
    return Scaffold(
      body: pages[currentidex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentidex,
        onTap: (int index) {
          setState(() {
            currentidex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
