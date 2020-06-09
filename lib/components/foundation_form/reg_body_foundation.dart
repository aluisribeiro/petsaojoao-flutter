import 'package:flutter/material.dart';

class RegBodyFoundation extends StatelessWidget {
  String title;
  RegBodyFoundation(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[200],
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
