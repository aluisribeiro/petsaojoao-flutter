import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petsaojoao/models/back_reg_my_pet/camera_information.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_information.dart';

import 'package:petsaojoao/screens/reg_my_pet/take_picture.dart';
import 'package:petsaojoao/screens/reg_my_pet/confirm_screen.dart';

import 'camera_information.dart';
import 'picture_information.dart';

class CameraInitializer {
  init(context) async {
    SystemChrome.setEnabledSystemUIOverlays([]);

    final camera = await CameInformation().getInfo();

    final image1 = await PictureInformation().getFirst();
    final image2 = await PictureInformation().getSecond();
    final image3 = await PictureInformation().getThird();

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
}
