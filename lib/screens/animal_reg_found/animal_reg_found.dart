import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/animal_reg_found/reg_info.dart';

//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class AnimalRegisterFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro animal encontrado'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegInfo()),
                  );
                },
                child:
                    Text("Ir Para Cadastro da Pessoa que Encontrou o Animal")),
          ]),
        ),
      ),
    );
  }
}
