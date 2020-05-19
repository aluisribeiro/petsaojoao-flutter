import 'package:flutter/material.dart';

import 'package:petsaojoao/components/reg_my_pet/picture_miniature_1.dart';
import 'package:petsaojoao/components/reg_my_pet/picture_miniature_2.dart';
import 'package:petsaojoao/components/reg_my_pet/picture_miniature_3.dart';
import 'package:petsaojoao/components/reg_my_pet/picture_miniature_4.dart';

pictureMiniatures(context, num, image1, image2, deleting) {
  if (deleting) {
    return pictureMiniatureFour(context);
  } else if (num == 1) {
    return pictureMiniatureOne(context);
  } else if (num == 2) {
    return pictureMiniatureTwo(context, image1);
  } else if (num == 3) {
    return pictureMiniatureThree(context, image1, image2);
  } else {
    return Center(child: CircularProgressIndicator());
  }
}
