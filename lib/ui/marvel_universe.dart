import 'package:flutter/material.dart';
import 'package:marvel_universe/utils/colors.dart';

import 'characters/characters_page.dart';

class MarvelUniverse extends StatelessWidget {
  const MarvelUniverse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primary,
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32)
      ),
      home: const CharactersPage(title: 'Marvel Characters'),
    );
  }
}