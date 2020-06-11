import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/camera_functions.dart';
import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';

import 'package:petsaojoao/screens/dashboard/dashboard.dart';

class PopUpSelector {
  void showDelete(context, num) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red[900],
                  ),
                  Text("Apagar Foto?"),
                ],
              ),
            ),
            content: Text(
              "Deseja apagar a foto selecionada e tirar uma nova?",
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Não"),
              ),
              FlatButton(
                onPressed: () {
                  CameraFunctions().deletePicture(context, num);
                },
                child: Text(
                  "Sim",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
      barrierDismissible: true);

  void showLoading(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Text("Enviando Imagens..."),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
            content: Text(
              "Por favor, aguarde um momento enquanto processamos suas imagens...",
              style: TextStyle(color: Colors.black54),
            ),
          ),
      barrierDismissible: true);

  void showRedirect(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.green[900],
                  ),
                  Text("Pronto!"),
                ],
              ),
            ),
            content: Text(
              "Suas imagens foram salvas em nosso sistema!",
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  releaseOrientation();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                child: Text("ok"),
              ),
            ],
          ),
      barrierDismissible: true);
}
