import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/picture_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/camera_info.dart';

import 'package:petsaojoao/screens/reg_my_pet/take_picture.dart';
import 'package:petsaojoao/screens/reg_my_pet/confirm_screen.dart';

void deleteFunction(context, num) async {
  if (num == 1) {
    final path = await getFirstPic();
    await verifyPicPath(path);
    takePicture(context, num);
  } else if (num == 2) {
    final path = await getSecondPic();
    await verifyPicPath(path);
    takePicture(context, num);
  } else if (num == 3) {
    final path = await getThirdPic();
    await verifyPicPath(path);
    takePicture(context, num);
  }
}

void takePicture(context, num) async {
  final camera = await getCameraInfo();

  final image1 = await getFirstPic();
  final image2 = await getSecondPic();
  final image3 = await getThirdPic();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TakePicture(
        camera: camera,
        num: num,
        deleting: true,
        nextPage: ConfirmScreen(
          image1: image1,
          image2: image2,
          image3: image3,
        ),
      ),
    ),
  );
}
