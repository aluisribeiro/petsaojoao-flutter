import 'package:flutter/material.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

pictureMiniatureFour(context) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Tirar Nova Foto",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              ),
            ],
          ),
        )
      ],
    ),
  );
}
