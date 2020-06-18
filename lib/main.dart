import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petsaojoao/screens/splash_screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueAccent[200],
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet São João',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent[200],
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
