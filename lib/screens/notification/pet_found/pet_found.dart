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
  //Valores padroes 
  String date = "";
  String hour = "";
  String name = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            CarouselWithIndicatorDemo(),
            Row(
                children: <Widget>[
                Text(
                  "Pet encontrado ",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    ),
                  ),
                Text("dia: ${date} Hora: ${hour}"),
                ],
              ),          
            Row(
              children: <Widget>[
                Text(
                  "Quem encontrou: ${name}",
                  style: TextStyle(
                    fontFamily: 'Roboto'
                  ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  GestureDetector(
                  onTap: (){
                    print("icone1");
                  },
                  child:
                    Icon(
                      MdiIcons.whatsapp,
                      color: Colors.black54,
                      size: 50.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("icone2");
                    },
                    child:
                      Icon(
                        Icons.call,
                        color: Colors.black54,
                        size: 50.0,
                      ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("icone3");
                    },
                    child:
                      Icon(
                        Icons.email,
                        color: Colors.black54,
                        size: 50.0,
                      ),
                  ),
                ],
              ),
            Text(
              "ESTE PET E SEU?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios
                  ),
                  color: Colors.blueAccent,
                  onPressed: (){},
                  label: 
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:  Text(
                        "NAO",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0))
                ),
                FlatButton.icon(
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.location_on
                  ),
                  color: Colors.blueAccent,
                  onPressed: (){},
                  label: 
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:  Text(
                        "NAO",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0))
                ),
              ],
            )
            ],
          ),
        ),
    );
  }
}