//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_foundation.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';
import 'package:petsaojoao/screens/register_tutor/andress_info.dart';
import 'package:petsaojoao/screens/register_tutor/personal_info.dart';
import 'package:petsaojoao/services/repo_reg_tutor/api_rest_tutor.dart';

import 'contact_info.dart';

class EndRegisterTutor extends StatefulWidget {
  @override
  _EndRegisterTutorState createState() => _EndRegisterTutorState();
}

class _EndRegisterTutorState extends State<EndRegisterTutor> {
  var email = FormContact().getEmail();
  var name = FormPersonal().getName();
  var rg = FormPersonal().getRg();
  var cpf = FormPersonal().getCpf();
  var phone = FormContact().getPhone();
  var whatsapp = FormContact().getWhatsapp();
  var cep = FormAndress().getCep();
  var street = FormAndress().getStreet();
  var number = FormAndress().getNumber();
  var area = FormAndress().getArea();
  var complement = FormAndress().getComplementAddress();

  void navigationToNextPage() async {
    //Navigator.push(context, _createRoute());
    //Navigator.pushReplacement(context, _createRoute());
    PostApi().post();
    await ApiRestTutor.post(email, name, rg, cpf, phone, whatsapp, cep, street,
        number, area, complement);
  }

  startCadTutorTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startCadTutorTimer();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueAccent[200],
          body: SplahScreenFoundation("Pronto!"),
        ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Dashboard(),
    transitionDuration: const Duration(milliseconds: 1800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class PostApi {
  void post() {
    print("--Email--> " + FormContact().getEmail());
    print("--Name--> " + FormPersonal().getName());
    print("--Rg--> " + FormPersonal().getRg());
    print("--CPF--> " + FormPersonal().getCpf());
    print("--Phone--> " + FormContact().getPhone());
    print("--WhatsApp--> " + FormContact().getWhatsapp());
    print("--CEP--> " + FormAndress().getCep());
    print("--Street--> " + FormAndress().getStreet());
    print("--Number--> " + FormAndress().getNumber());
    print("--Area--> " + FormAndress().getArea());
  }
}
