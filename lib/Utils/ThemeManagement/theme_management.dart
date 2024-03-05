import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';



class ThemeManager extends ChangeNotifier{





  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  changeTheme(bool isDarkMode)async
  {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("THEME", !isDarkMode);
    _themeMode = !(_pref.getBool("THEME") == true) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  //  getThemeValue()
  // {
  //   return themeMode == ThemeMode.light ? true : false;
  // }















  static bool _isDark = true;


  get darkTheme => _isDark;

  ThemeManager(){
    if(box!.containsKey("currentTheme"))
    {
      _isDark = box!.get("currentTheme");
    }
    else
    {
      box!.put("currentTheme", _isDark);
    }
  }

  ThemeMode currentTheme()
  {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  switchTheme()
  {
    _isDark = !_isDark;
    box!.put("currentTheme", _isDark);
    notifyListeners();
  }








}