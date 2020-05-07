import 'package:flutter/material.dart';

class ThemeChangerBloc with ChangeNotifier {
  final _brightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],
    accentColor: Colors.lightBlue,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  bool _isDarkSelected = false;

  ThemeData getTheme() => _isDarkSelected ? _darkTheme : _brightTheme;

  void setTheme(bool isDark) {
    _isDarkSelected = isDark;
    notifyListeners();
  }
}
