import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petsaojoao/models/back_reg_my_pet/camera_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_info.dart';

import 'package:petsaojoao/screens/reg_my_pet/take_picture.dart';
import 'package:petsaojoao/screens/reg_my_pet/confirm_screen.dart';

cameraInitializer(context) async {
  SystemChrome.setEnabledSystemUIOverlays([]);

  final camera = await getCameraInfo();

  final image1 = await getFirstPic();
  final image2 = await getSecondPic();
  final image3 = await getThirdPic();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TakePicture(
        camera: camera,
        num: 1,
        deleting: false,
        nextPage: TakePicture(
          camera: camera,
          image1: image1,
          image2: image2,
          num: 2,
          deleting: false,
          nextPage: TakePicture(
            camera: camera,
            image1: image1,
            image2: image2,
            num: 3,
            deleting: false,
            nextPage: ConfirmScreen(
              image1: image1,
              image2: image2,
              image3: image3,
            ),
          ),
        ),
      ),
    ),
  );
}
