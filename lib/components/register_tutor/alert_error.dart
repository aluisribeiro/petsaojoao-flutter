import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AlertError {
  var icon;
  var title;
  var content;
  AlertError(icon, title, content) {
    this.icon = icon;
    this.title = title;
    this.content = content;
  }
  void showAlert(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
                child: Column(children: [
              Icon(
                icon,
                size: 30,
                color: Colors.red[900],
              ),
              Text(title),
            ])),
            content: Text(
              content,
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          ),
      barrierDismissible: true);
}
