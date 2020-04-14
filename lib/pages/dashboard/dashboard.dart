import 'package:flutter/material.dart';
import 'package:petsaojoao/pages/cad_tutor/cadastro_tutor.dart';
import 'package:petsaojoao/pages/cad_animal_encotrado/cadastro_animal_encontrado.dart';

//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cadastro_tutor()),
                  );
                },
                child: Text("Ir Para Cadastro de Tutor")),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cadastro_animal_encontrado()),
                  );
                },
                child: Text("Cadastro Animal Encontrado ")),
          ]),
        ),
      ),
    );
  }
}
