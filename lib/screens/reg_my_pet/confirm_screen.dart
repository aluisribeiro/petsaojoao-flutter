import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/sizes_info.dart';
import 'package:petsaojoao/components/reg_my_pet/alert_confirm.dart';
import '../../models/back_reg_my_pet/sizes_info.dart';

import 'package:petsaojoao/screens/reg_my_pet/end_register_pet_photos.dart';

class ConfirmScreen extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;

  ConfirmScreen({Key key, this.image1, this.image2, this.image3})
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
      num = 1;
    });
  }

  int num;
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
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: CalculateSize().by(context, 1.55),
                    child: new Image.file(File(bigImage)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: CalculateSize().by(context, 50),
                      top: CalculateSize().by(context, 1.75)),
                  child: FlatButton(
                    onPressed: () {
                      PopUpSelector().showDelete(context, num);
                    },
                    child: Icon(
                      Icons.delete,
                      size: CalculateSize().by(context, 18),
                      color: Colors.red[200],
                    ),
                  ),
                )
              ],
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
                    height: CalculateSize().by(context, 10),
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image1;
                            num = 1;
                          },
                        );
                      },
                      child: Container(child: Image.file(File(image1))),
                    ),
                  ),
                  Container(
                    height: CalculateSize().by(context, 10),
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image2;
                            num = 2;
                          },
                        );
                      },
                      child: Container(child: Image.file(File(image2))),
                    ),
                  ),
                  Container(
                    height: CalculateSize().by(context, 10),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            bigImage = image3;
                            num = 3;
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
            ),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute( builder: (contexto) => EndRegisterPetPhotos()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
