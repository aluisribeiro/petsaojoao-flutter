import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/animal_reg_found/contact_info.dart';
import 'package:petsaojoao/screens/animal_reg_found/end_animal_reg_found.dart';

class SplahScreenRegister extends StatelessWidget {
  String contentText;
  SplahScreenRegister(String contentText) {
    this.contentText = contentText;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(child: Image.asset('assets/background/top_paws.png')),
      SizedBox(
        height: 100,
      ),
      Center(
        child: Container(
          width: 350,
          child: Text(
            contentText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactInfo()));
              },
              child: Text("SIM"),
              textColor: Colors.white,
            )),
            Expanded(
                child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EndAnimalRegFound()));
              },
              child: Text("NÃO"),
              textColor: Colors.white,
            )),
          ],
        ),
      ),
      SizedBox(height: 20),
      Container(child: Image.asset('assets/background/bottom_paws.png')),
    ]);
  }
}
