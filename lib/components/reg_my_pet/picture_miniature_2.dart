import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

pictureMiniatureTwo(context, image1) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                "1 de 3 ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              child: Text(
                'fotos registradas',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: widgetSize(context, 10),
                child: Image.file(File(image1)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}