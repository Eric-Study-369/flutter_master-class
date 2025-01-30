import 'package:flutter/material.dart';
import 'package:flutter_tutorial/theme/dark_mode.dart';
import 'package:flutter_tutorial/theme/light_mode.dart';

class ThemProvider extends ChangeNotifier {
  // initialy, ight mode
  ThemeData _themeData = lightMode;

  // get current theme
  ThemeData get themeData => _themeData;

  // is current them dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
