import 'package:flutter/material.dart';

Widget InfoData() {
  return Container(
    padding: EdgeInsets.only(
      left: 15,
    ),
    child: Row(children: <Widget>[
      Container(
        height: 30,
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Seus dados serão divulgados pelo aplicativo"),
            ]),
      )
    ]),
  );
}
