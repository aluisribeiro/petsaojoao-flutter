import 'package:flutter/material.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_register.dart';

class RegInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: SplahScreenRegister("Deseja ser contactado?"),
      ),
    );
  }
}
