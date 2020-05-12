import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';

//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pagina Login'),
        ),
        body: Center(
          child: Container(
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: Text("Ir Para dashboard")),
          ),
        ),
      ),
    );
  }
}
