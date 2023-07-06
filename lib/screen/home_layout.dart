
import 'package:flutter/material.dart';
import 'package:to_do/screen/setting.dart';
import 'package:to_do/screen/widgets/show_add_bottom_sheet.dart';

import 'task_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
int Index =0;
List<Widget>tabs=[const TaskScreen(),SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          title: Text(
        "To Do List",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.white),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
     ShowAddBootomSheet(context);
      },
      shape: StadiumBorder(side: BorderSide(color: Colors.white)),
      child: const Icon(Icons.add,
          size: 30,
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: Index,
            onTap: (value){
              Index=value;
              setState(() {
              });
            },
            iconSize: 30, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ]),
      ),
      body: tabs[Index],
    );
  }
}
void ShowAddBootomSheet(BuildContext context){
   showModalBottomSheet(context: context,
       isScrollControlled: true,
       builder: (context){
   return Padding(
     padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
     child: showAddBootomSheet(),
   );
  });
}