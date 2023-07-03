import 'package:flutter/material.dart';
import 'package:to_do/style/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: Colors.black,
      ),
      bodyMedium:  TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey,


    ),
  );
}