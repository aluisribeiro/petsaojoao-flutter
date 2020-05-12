import 'package:flutter/material.dart';

class BodyFoundation extends StatelessWidget {
  String step;
  String title;
  BodyFoundation(String step, String title) {
    this.step = step;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[200],
      child: Column(
        children: <Widget>[
          Center(
              child: Text(
            step,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
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
