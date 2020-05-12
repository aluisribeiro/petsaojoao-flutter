import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petsaojoao/models/back_reg_my_pet/camera_info.dart';
import 'package:petsaojoao/screens/reg_my_pet/take_first_picture.dart';

class PicInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: ListView(
          children: <Widget>[
            Container(
                child: Image.asset('assets/cad_animal/cachorro_lateral.png')),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Por favor, tente tirar uma foto de perfil igual a imagem acima...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
                SystemChrome.setEnabledSystemUIOverlays([]);

                final camera = await getCameraInfo();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeFirstPic(
                      camera: camera,
                    ),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: (Text('Vamos Lá!')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
