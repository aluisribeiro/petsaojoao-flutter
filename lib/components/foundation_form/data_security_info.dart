import 'package:flutter/material.dart';

class DataSecurityInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Row(children: <Widget>[
        FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Center(
                            child: Column(children: [
                          Icon(
                            Icons.info,
                            size: 30,
                            color: Colors.green,
                          ),
                          Text("Importância dos dados "),
                        ])),
                        content: Text(
                          "É muito importante informar todos os dados possíveis do seu Pet para que possamos tomar todas as medidas possíveis em caso de perda.",
                          style: TextStyle(color: Colors.black54),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("ok"),
                          ),
                        ],
                      ),
                  barrierDismissible: true);
            },
            child: Container(
              height: 30,
              width: 270,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                    Text("Por que precisamos desses dados?"),
                  ]),
            ))
      ]),
    );
  }
}
