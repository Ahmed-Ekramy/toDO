import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider  extends ChangeNotifier
{
  ThemeMode themeMode=ThemeMode.light;
  String langcode="en";
  void changeTheme(ThemeMode theme){
    themeMode=theme;
    notifyListeners();
}
void changeLang( String lang){
    langcode=lang;
    notifyListeners();
}

}