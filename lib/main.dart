import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'Tugas/Tugas12/login_screen.dart';
//import '../Tugas/Tugas11/telegram.dart';
//import '../Tugas/Tugas13/login.dart';
//import 'Tugas/tugas14/get_data.dart';
//import 'Tugas/tugas15/splash_screen/splash_screen.dart';

import 'final_project/splash/splash.dart';

//import 'quiz3/screen/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splash(),
    );
  }
}
