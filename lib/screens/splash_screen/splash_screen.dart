import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';
import 'package:petsaojoao/screens/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

     fit: StackFit.expand,
     children: <Widget>[
       Container(
         color: Theme.of(context).primaryColor,
         child: FlareActor("assets/splash_screen/Paws2.flr",
             alignment: Alignment.center,
             fit: BoxFit.contain,
             animation: "movement"),
       ),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
             width: 130,
             child: Image.asset("assets/splash_screen/logo.png"),
           ),
         ],
       ),
     ],
   ),
    
 );
  }
}
