import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

pictureMiniatureThree(context, image1, image2) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                "2 de 3 ",
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
                height: CalculateSize().by(context, 10),
                padding: EdgeInsets.only(right: 20),
                child: Image.file(File(image1)),
              ),
              Container(
                height: CalculateSize().by(context, 10),
                child: Image.file(File(image2)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
