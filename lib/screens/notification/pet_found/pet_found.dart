import 'package:flutter/cupertino.dart';
import 'carousel.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PetFound extends StatefulWidget {
  @override
    _PetFoundState createState() => _PetFoundState();
}

class _PetFoundState extends State<PetFound> {
  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              8.0, 25.0, 8.0, 10.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CarouselWithIndicatorDemo(),
                Padding (
                  padding: const EdgeInsets.all(10.0
                  ),
                  child:
                  Align(
                    child:
                    Row(
                      children: <Widget>[
                        Text (
                          "Pet encontrado:  ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text (
                          "dia:  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text (
                          "Hora: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                Padding (
                  padding: const EdgeInsets.all(10.0),
                  child:
                  Align(
                    child:
                    Text (
                      "Quem achou: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                      ),
                    ),

                    alignment: Alignment.bottomLeft,
                  ),
                ),
                Padding (
                  padding: const EdgeInsets.all(20.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.whatsapp,
                          color: Colors.black54,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.black54,
                          size: 50.0,
                        ),
                        Icon(
                          Icons.email,
                          color: Colors.black54,
                          size: 50.0,
                        )
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0
                  ),
                  child:
                  Align(
                    child:
                    Text ("ESTE PET É SEU?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.6,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(
                              Icons.arrow_back_ios
                          ),
                          label: Text('NÃO',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              fontFamily: 'Roboto',
                              letterSpacing: 1.0,
                            ),
                          ),

                          color: Colors.blueAccent,
                          onPressed: () {},
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))

                        ),
                        FlatButton.icon(
                          icon: Icon(
                              Icons.location_on
                          ),
                          label: Text('SIM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              letterSpacing: 1.0,
                            ),
                          ),

                            color: Colors.blueAccent,
                          onPressed: () {},
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                        ),
                      ],
                      buttonHeight: 42.0,
                      buttonMinWidth: 113.0,
                      //buttonPadding: EdgeInsets.all(5.0),
                      buttonPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 1.0),
                      alignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}


