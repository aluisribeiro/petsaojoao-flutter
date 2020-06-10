import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class PictureInformation {
  getFirst() async {
    final path = join((await getTemporaryDirectory()).path, 'PET-img1.png');

    return path;
  }

  getSecond() async {
    final path = join((await getTemporaryDirectory()).path, 'PET-img2.png');

    return path;
  }

  getThird() async {
    final path = join((await getTemporaryDirectory()).path, 'PET-img3.png');

    return path;
  }

  verifyPath(path) async {
    if (File(path).existsSync()) {
      File(path).deleteSync(recursive: true);
      PaintingBinding.instance.imageCache.clear();
    }
  }
}
