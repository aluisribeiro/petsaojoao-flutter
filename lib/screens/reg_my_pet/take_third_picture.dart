import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

import 'confirm_screen.dart';

class TakeThirdPic extends StatefulWidget {
  final CameraDescription camera;
  final String image1;
  final String image2;

  const TakeThirdPic({
    Key key,
    @required this.camera,
    @required this.image1,
    @required this.image2,
  }) : super(key: key);

  @override
  _TakeThirdPicState createState() => _TakeThirdPicState();
}

class _TakeThirdPicState extends State<TakeThirdPic> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  // TODO: implement widget
  TakeThirdPic get widget => super.widget;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = widget.image1;
    String image2 = widget.image2;
    return new WillPopScope(
      onWillPop: () async {
        return null;
      },
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
                      child: CameraPreview(_controller)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "2 de 3 ",
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
                          padding: EdgeInsets.only(right: 20),
                          child: Image.file(File(image1)),
                        ),
                        Container(
                          height: widgetSize(context, 10),
                          child: Image.file(File(image2)),
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

              final path = await getThirdPic();
              await verifyPicPath(path);

              await _controller.takePicture(path);

              final image1 = await getFirstPic();
              final image2 = await getSecondPic();
              final image3 = await getThirdPic();

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
