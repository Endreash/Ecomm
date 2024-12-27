import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initially, light mode
  ThemeData _themeData = lightTheme;

  // get current theme
  ThemeData get themeData => _themeData;

  // is current theme dark mode
  bool get isDarkMode => _themeData == darkTheme;

  // set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightTheme){
      themeData = darkTheme;
    } else{
      themeData = lightTheme;
    }
  }
}