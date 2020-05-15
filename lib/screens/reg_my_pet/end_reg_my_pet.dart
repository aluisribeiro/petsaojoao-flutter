import 'package:flutter/material.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_upload_firebase.dart';

import 'package:petsaojoao/screens/dashboard/dashboard.dart';

import '../dashboard/dashboard.dart';
import '../register_tutor/personal_info.dart';
import '../register_tutor/personal_info.dart';

class EndRegMyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: ListView(
          children: <Widget>[
            Container(child: Image.asset('assets/background/top_paws.png')),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Finalizar Cadastro?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.lightGreenAccent,
              textColor: Colors.black,
              disabledColor: Colors.green,
              disabledTextColor: Colors.grey,
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Dashboard(),
                ));
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: (Text('Enviar')),
              ),
            ),
            Container(child: Image.asset('assets/background/bottom_paws.png')),
          ],
        ),
      ),
    );
  }
}
