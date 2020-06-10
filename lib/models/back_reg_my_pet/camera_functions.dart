import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/picture_information.dart';
import 'package:petsaojoao/models/back_reg_my_pet/camera_information.dart';

import 'package:petsaojoao/screens/reg_my_pet/take_picture.dart';
import 'package:petsaojoao/screens/reg_my_pet/confirm_screen.dart';

import 'picture_information.dart';

class CameraFunctions {
  void deletePicture(context, num) async {
    if (num == 1) {
      takePicture(context, num);
    } else if (num == 2) {
      takePicture(context, num);
    } else if (num == 3) {
      takePicture(context, num);
    }
  }

  void takePicture(context, num) async {
    final camera = await CameInformation().getInfo();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePicture(
          camera: camera,
          num: num,
          deleting: true,
        ),
      ),
    );
  }

  void ifRedirect(context, deleting, nextPage) async {
    if (deleting) {
      final image1 = await PictureInformation().getFirst();
      final image2 = await PictureInformation().getSecond();
      final image3 = await PictureInformation().getThird();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            image1: image1,
            image2: image2,
            image3: image3,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );
    }
  }
}
