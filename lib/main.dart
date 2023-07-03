import 'package:flutter/material.dart';
import 'package:to_do/screen/home_layout.dart';
import 'package:to_do/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeLayout.routeName ,
      routes: {

        HomeLayout.routeName:(context)=>const HomeLayout(),
      },
      theme:MyTheme.lightTheme ,
    );
  }
}