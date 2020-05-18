import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String novoToken = "";

  @override
  void initState() {
    super.initState();
    this.startFirebaseListeners();
  }
    
  void startFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("Menssagem: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("Resume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("Launch: $message");
      }
    );

    _firebaseMessaging.getToken().then((token) {
      print("Token_____________________________: " + token + " Fim do token");
      setState(() {
       novoToken = token; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child:Column(
          children: <Widget>[
            Text(novoToken)
          ],
        )
      )
    );
  }
}
