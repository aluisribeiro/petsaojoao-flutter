import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/delete_function.dart';

class ConfirmAlert {
  var icon = Icons.delete;
  var title = 'Apagar Foto';
  var content = 'Deseja apagar a foto selecionada e tirar uma nova?';

  void showAlert(context, num) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.red[900],
                  ),
                  Text(title),
                ],
              ),
            ),
            content: Text(
              content,
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
                  takePicture(context, num);
                },
                child: Text(
                  "Sim",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
      barrierDismissible: true);
}
