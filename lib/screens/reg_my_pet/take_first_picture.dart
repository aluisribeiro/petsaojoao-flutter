import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:petsaojoao/models/back_reg_my_pet/camera_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

import 'take_second_picture.dart';

class TakeFirstPic extends StatefulWidget {
  final CameraDescription camera;

  const TakeFirstPic({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _TakeFirstPicState createState() => _TakeFirstPicState();
}

class _TakeFirstPicState extends State<TakeFirstPic> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    blockOrientation();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: null,
//          () async {
      //   return null;
//      },
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: <Widget>[
                  Container(
                    height: widgetSize(context, 1.55),
                    width: widgetSize(context, 1.5),
                    child: CameraPreview(_controller),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "0 de 3 ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
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
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1.5,
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            try {
              await _initializeControllerFuture;

              final path = await getFirstPic();

              await verifyPicPath(path);

              final camera = await getCameraInfo();
              await _controller.takePicture(path);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TakeSecondPic(camera: camera, image1: path),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
