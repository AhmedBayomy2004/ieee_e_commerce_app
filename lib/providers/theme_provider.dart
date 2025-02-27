import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currTheme = ThemeMode.system;

  Icon currIcon = Icon(Icons.light_mode);
  ThemeProvider() {
    updateTheme();
  }

  void updateTheme() {
    if (currTheme == ThemeMode.system) {
      Brightness brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      currTheme =
          brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
      currIcon = brightness == Brightness.light
          ? Icon(Icons.light_mode)
          : Icon(Icons.dark_mode);
    } else {
      currTheme =
          currTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      currIcon = currTheme == ThemeMode.light
          ? Icon(Icons.light_mode)
          : Icon(Icons.dark_mode);
    }
    notifyListeners();
  }
}
