import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/provider/my_provider.dart';
import 'package:to_do/screen/home_layout.dart';
import 'package:to_do/screen/widgets/update_screen.dart';
import 'package:to_do/style/theme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) { return MyProvider(); },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeLayout.routeName ,
      routes: {
        HomeLayout.routeName:(context)=>const HomeLayout(),
        UpdateScreen.routeName:(context)=> UpdateScreen(),
      },
      themeMode:prov.themeMode ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}