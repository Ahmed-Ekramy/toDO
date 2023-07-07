import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider  extends ChangeNotifier
{
  ThemeMode themeMode=ThemeMode.light;
  void changeTheme(ThemeMode theme){
    themeMode=theme;
    notifyListeners();
}
}