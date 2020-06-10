import 'package:flutter/cupertino.dart';
import 'carousel.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:petsaojoao/models/back_pet_found/buttom_functions.dart';

class PetFoundBoard extends StatefulWidget {
  @override
  _PetFoundBoardState createState() => _PetFoundBoardState();
}

class _PetFoundBoardState extends State<PetFoundBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: ListView(
          children: <Widget>[
            CarouselWithIndicatorDemo(),
            InfoPetFoundBoard(),
            IconsForContact(),
            ThisYourPet(),
          ],
        ),
      ),
    );
  }
}

class InfoPetFoundBoard extends StatefulWidget {
  @override
  _InfoPetFoundBoardState createState() => _InfoPetFoundBoardState();
}

class _InfoPetFoundBoardState extends State<InfoPetFoundBoard> {
  String date = "";
  String hour = "";
  String name = "";

  final _labelPetFoundBoard = "Pet encontrado";
  final _fontFamilyRoboto = 'Roboto';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              _labelPetFoundBoard,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                fontFamily: _fontFamilyRoboto,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("dia: ${date} Hora: ${hour}"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(
              "Quem encontrou: ${name}",
              style: TextStyle(fontFamily: _fontFamilyRoboto),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}

class IconsForContact extends StatefulWidget {
  @override
  _IconsForContactState createState() => _IconsForContactState();
}

class _IconsForContactState extends State<IconsForContact> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              buttomFunctions().launchWhatsapp();
            },
            child: Icon(
              MdiIcons.whatsapp,
              color: Colors.black54,
              size: 50.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              buttomFunctions().makeCall();
            },
            child: Icon(
              Icons.call,
              color: Colors.black54,
              size: 50.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              buttomFunctions().createEmail();
            },
            child: Icon(
              Icons.email,
              color: Colors.black54,
              size: 50.0,
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Divider(),
      SizedBox(height: 30),
    ]);
  }
}

class ThisYourPet extends StatefulWidget {
  @override
  _ThisYourPetState createState() => _ThisYourPetState();
}

class _ThisYourPetState extends State<ThisYourPet> {
  final _fontFamilyRoboto = 'Roboto';
  final _labelThisPet = "ESTE PET É SEU?";
  final _labelNegative = "NÃO";
  final _labelPositive = "SIM";
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        _labelThisPet,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamilyRoboto,
          fontSize: 16,
        ),
      ),
      SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton.icon(
              textColor: Colors.white,
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.blueAccent,
              onPressed: () {},
              label: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _labelNegative,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: _fontFamilyRoboto,
                  ),
                ),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(3.0))),
          FlatButton.icon(
              textColor: Colors.white,
              icon: Icon(Icons.location_on),
              color: Colors.blueAccent,
              onPressed: () {},
              label: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _labelPositive,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: _fontFamilyRoboto,
                  ),
                ),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(3.0))),
        ],
      )
    ]);
  }
}

