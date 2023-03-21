import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ui/marvel_universe.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MarvelUniverse());
}
