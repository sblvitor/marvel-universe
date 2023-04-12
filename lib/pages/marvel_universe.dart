import 'package:flutter/material.dart';
import 'package:marvel_universe/utils/colors.dart';
import 'characters_page.dart';
import 'comics_page.dart';
import 'search_page.dart';

class MarvelUniverse extends StatefulWidget {
  const MarvelUniverse({super.key});

  @override
  State<MarvelUniverse> createState() => _MarvelUniverseState();
}

class _MarvelUniverseState extends State<MarvelUniverse> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primary,
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32)
      ),
      home: Scaffold(
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
      ),
    );
  }
}