
import 'package:flutter/material.dart';

class ThemeModeManager with ChangeNotifier{

  get selectedTheme => _selectedThemeMode;

  ThemeMode _selectedThemeMode = ThemeMode.system;

  changeTheme({required bool isDarkMode}){
    if(isDarkMode == true){
      _selectedThemeMode = ThemeMode.dark;
      notifyListeners();
    }else if(isDarkMode == false){
      _selectedThemeMode = ThemeMode.light;
      notifyListeners();
    }
  }
}