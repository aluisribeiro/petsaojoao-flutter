import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';
import 'package:petsaojoao/models/back_reg_my_pet/miniatures.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_save.dart';

import '../../models/back_reg_my_pet/camera_functions.dart';
import '../../models/back_reg_my_pet/miniatures.dart';
import '../../models/back_reg_my_pet/picture_save.dart';

class TakePicture extends StatefulWidget {
  final CameraDescription camera;
  final String image1;
  final String image2;
  final int num;
  final Widget nextPage;
  final bool deleting;

  const TakePicture({
    Key key,
    @required this.camera,
    @required this.num,
    @required this.nextPage,
    this.deleting,
    this.image1,
    this.image2,
  }) : super(key: key);

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
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
  // TODO: implement widget
  TakePicture get widget => super.widget;

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _num = widget.num;
    final _deleting = widget.deleting;
    String _image1 = widget.image1;
    String _image2 = widget.image2;
    Widget _nextPage = widget.nextPage;
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
                    height: CalculateSize().by(context, 1.55),
                    width: CalculateSize().by(context, 1.5),
                    child: CameraPreview(_controller),
                  ),
                  Miniatures()
                      .selector(context, _num, _image1, _image2, _deleting),
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
              await Picture()
                  .save(_initializeControllerFuture, _num, _controller);

              CameraFunctions().ifRedirect(context, _deleting, _nextPage);
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
