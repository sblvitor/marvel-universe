import 'package:flutter/material.dart';
import 'package:marvel_universe/pages/search_page.dart';

import 'characters_page.dart';
import 'comics_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        unselectedItemColor: Colors.white60,
        currentIndex: _currentIndex,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Characters"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Comics")
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          CharactersPage(title: 'Marvel Characters'),
          SearchPage(),
          ComicsPage(title: "Comics",),
        ],
      ),
    );
  }
}