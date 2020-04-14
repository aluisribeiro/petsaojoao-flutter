import 'package:flutter/material.dart';
import 'package:petsaojoao/pages/splash_screen/splashScreen.dart';
//import 'package:petsaojoao/pages/cadTutorForm/tutorForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet São João',
      debugShowMaterialGrid: false,
      theme: ThemeData(
          primaryColor: Colors.blueAccent[200], primarySwatch: Colors.blue),
      home: splash_screen(),
    );
  }
}
