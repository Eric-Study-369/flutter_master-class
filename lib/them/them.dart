import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400,
      inversePrimary: Colors.grey.shade800,
    ));

//dart mode
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: const Color.fromARGB(255, 30, 30, 30),
      secondary: const Color.fromARGB(255, 20, 20, 20),
      inversePrimary: Colors.grey.shade300,
    ));
