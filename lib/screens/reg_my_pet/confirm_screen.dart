import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';
import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';

import 'end_reg_my_pet.dart';

class ConfirmScreen extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final Widget nextPage;

  ConfirmScreen({Key key, this.image1, this.image2, this.image3, this.nextPage})
      : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  // TODO: implement widget
  ConfirmScreen get widget => super.widget;

  void initState() {
    super.initState();

    setState(() {
      bigImage = widget.image1;
    });
  }

  String bigImage = '';

  @override
  Widget build(BuildContext context) {
    String image1 = widget.image1;
    String image2 = widget.image2;
    String image3 = widget.image3;

    return new WillPopScope(
      onWillPop: () async {
        return null;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: widgetSize(context, 1.55),
              child: new Image.file(File(bigImage)),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "3 de 3 ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: widgetSize(context, 10),
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image1;
                          },
                        );
                      },
                      child: Container(child: Image.file(File(image1))),
                    ),
                  ),
                  Container(
                    height: widgetSize(context, 10),
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image2;
                          },
                        );
                      },
                      child: Container(child: Image.file(File(image2))),
                    ),
                  ),
                  Container(
                    height: widgetSize(context, 10),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image3;
                          },
                        );
                      },
                      child: Container(child: Image.file(File(image3))),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            )
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () async {
            await releaseOrientation();

            try {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EndRegMyPet(),
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
