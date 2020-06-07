//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_foundation.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';
import 'package:petsaojoao/screens/reg_my_pet/reg_my_pet.dart';
import 'package:petsaojoao/screens/register_tutor/andress_info.dart';
import 'package:petsaojoao/screens/register_tutor/personal_info.dart';
import 'package:petsaojoao/services/repo_reg_tutor/api_rest_tutor.dart';
import 'contact_info.dart';

var id;
var email;

class EndRegisterTutor extends StatefulWidget {
  int getId() {
    return id;
  }

  String getEmail() {
    return email;
  }

  @override
  _EndRegisterTutorState createState() => _EndRegisterTutorState();
}

class _EndRegisterTutorState extends State<EndRegisterTutor> {
  var _labelScreem = "Enviando Dados";

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

  sendData() async {
    var dataError = "Falhou!";
    var result = await ApiRestTutor.post(email, name, rg, cpf, phone, whatsapp,
        cep, street, number, area, complement);

    if (result == null) {
      DrawerBottonError().show(context);

      setState(() {
        _labelScreem = dataError;
      });
    } else {
      var tutorId = result.id;
      var tutorEmail = result.email;
      var dataOk = "Pronto!";
      setState(() {
        id = tutorId;
        email = tutorEmail;
        _labelScreem = dataOk;
      });
      DrawerBottonPositive().show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    sendData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueAccent[200],
          body: SplahScreenFoundation(_labelScreem),
        ));
  }
}

Route _createRoute(route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
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

class DrawerBottonError {
  final _labelError = "Não foi possível enviar seus dados";
  final buttonTryAgain = "Tentar Novamente";
  final buttonCancel = "Cancelar";

  void show(context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              color: Colors.redAccent,
              child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.timesCircle,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(_labelError,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                color: Colors.redAccent,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(8.0),
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      _createRoute(EndRegisterTutor()));
                                },
                                child: Text(
                                  buttonTryAgain.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FlatButton(
                                color: Colors.redAccent,
                                textColor: Colors.brown[200],
                                padding: EdgeInsets.all(8.0),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, _createRoute(Dashboard()));
                                },
                                child: Text(
                                  buttonCancel.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])
                      ])));
        });
  }
}

class DrawerBottonPositive {
  final _labelPositive = "Deseja cadastrar seu pet agora?";
  final buttonYes = "Sim";
  final buttonLater = "Mais tarde";

  void show(context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              color: Colors.green,
              child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.checkCircle,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(_labelPositive,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 24.0)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(8.0),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, _createRoute(RegMyPet()));
                                },
                                child: Text(
                                  buttonYes.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.brown[200],
                                padding: EdgeInsets.all(8.0),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, _createRoute(Dashboard()));
                                },
                                child: Text(
                                  buttonLater.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])
                      ])));
        });
  }
}
