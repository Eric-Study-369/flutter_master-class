import 'package:flutter/material.dart';
import 'package:flutter_tutorial/them/them.dart';

class ThemProvider with ChangeNotifier {
  // initially, them is light mode
  ThemeData _themeData = lightMode;

  //getter method to acess the them from other parts of the code
  ThemeData get themeData => _themeData;

  //getter method to see if we are in dart mode or not
  bool get isDartMode => _themeData == darkMode;

  //setter method to set the new them
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

//we will use this toggle in switch later
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
