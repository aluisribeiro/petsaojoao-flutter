import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_foundation.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';
import 'package:petsaojoao/screens/animal_reg_found/contact_info.dart';
import 'package:petsaojoao/services/repo_reg_contact/api_rest_register.dart';

class EndAnimalRegFound extends StatefulWidget {
  @override
  _EndAnimalRegFoundState createState() => _EndAnimalRegFoundState();
}

class _EndAnimalRegFoundState extends State<EndAnimalRegFound> {
  var _labelScreen = "Enviando Dados";

  var email = FormContact().getEmail();
  var phone = FormContact().getPhone();
  var whatsapp = FormContact().getWhatsapp();

  void navigationToNextPage() {
    Navigator.pushReplacement(context, _createRoute());
  }

  startRegContactTimer() async {
    var dataOk = "Pronto!";
    setState(() {
      _labelScreen = dataOk;
    });
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToNextPage);
  }

  sendData() async {
    var dataError = "Falhou!";
    var result = await ApiRestRegister.post(email, phone, whatsapp);
    if (result == false) {
      DrawerBotton().show(context);
      setState(() {
        _labelScreen = dataError;
      });
    } else {
      startRegContactTimer();
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
          body: SplahScreenFoundation(_labelScreen),
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

class DrawerBotton {
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
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EndAnimalRegFound()));
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
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
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
