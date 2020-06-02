import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameInformation {
  getInfo() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras[0];
    return firstCamera;
  }
}
