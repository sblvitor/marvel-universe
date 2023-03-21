import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFFDE4E5),
  100: Color(0xFFF9BBBD),
  200: Color(0xFFF68E92),
  300: Color(0xFFF26166),
  400: Color(0xFFEF3F45),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFFEA1A20),
  700: Color(0xFFE7151B),
  800: Color(0xFFE41116),
  900: Color(0xFFDF0A0D),
});
const int _primaryPrimaryValue = 0xFFEC1D24;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFFA2A3),
  700: Color(0xFFFF898A),
});
const int _primaryAccentValue = 0xFFFFD5D6;