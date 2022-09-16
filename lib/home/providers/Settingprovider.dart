import 'package:flutter/material.dart';

class Settingprovider extends ChangeNotifier {
  String curentlang = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme;

    notifyListeners();
  }

  void changeLanguage(String newLang) {
    if (curentlang == newLang) {
      return;
    }
    curentlang = newLang;
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  bool isenglish() {
    return curentlang == 'en';
  }

  String getBackground() {
    return isDarkMode()
        ? 'assent/images/bg.png'
        : 'assent/images/default_bg.png';
  }
}
