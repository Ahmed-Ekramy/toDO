import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class ShowLanguageApp extends StatelessWidget {
  const ShowLanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    prov.changeTheme(ThemeMode.light);
                  },
                  child: Text("Light",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                          color: prov.themeMode == ThemeMode.light ?Colors.orange:Colors.white)),
                ),
                Spacer(),
                Icon(Icons.done,color: prov.themeMode == ThemeMode.light ?Colors.orange:Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                prov.changeTheme(ThemeMode.dark);
              },
              child: Row(
                children: [
                  Text(
                    "Dark",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge?.copyWith(color: prov.themeMode == ThemeMode.light ?Colors.black:Colors.orange),
                  ),
                  const Spacer(),
                  Icon(Icons.done,color: prov.themeMode == ThemeMode.light ?Colors.black:Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
