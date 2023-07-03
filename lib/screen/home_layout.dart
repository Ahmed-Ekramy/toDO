
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
static const String routeName="HomeLayout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo",s)),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),
  BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),

      ]),
    );
  }
}
