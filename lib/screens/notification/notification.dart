import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String newToken = "";

  @override
  void initState() {
    super.initState();
    this.startFirebaseListeners();
  }

  void openScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard()
      )
    );
  }

  void startFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("Menssagem: $message");
        openScreen();
      },
      onResume: (Map<String, dynamic> message) async {
        print("Resume: $message");
        openScreen();
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("Launch: $message");
        openScreen();
      }
    );

    _firebaseMessaging.getToken().then((token) {
      print("Token_____________________________: " + token + " Fim do token");
      setState(() {
       newToken = token;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
