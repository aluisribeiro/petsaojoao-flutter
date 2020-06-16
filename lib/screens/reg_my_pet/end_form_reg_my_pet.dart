import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/splash_screen_foundation.dart';
import 'package:petsaojoao/models/back_reg_my_pet/camera_initializer.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';
import 'package:petsaojoao/screens/reg_my_pet/my_pet_info_first.dart';
import 'package:petsaojoao/screens/reg_my_pet/my_pet_info_second.dart';
import 'package:petsaojoao/screens/reg_my_pet/my_pet_info_third.dart';
import 'package:petsaojoao/services/repo_reg_my_pet/api_rest_reg_my_pet.dart';

class EndFormRegMypet extends StatefulWidget {
  @override
  _EndFormRegMypetState createState() => _EndFormRegMypetState();
}

class _EndFormRegMypetState extends State<EndFormRegMypet> {
  var _labelScreem = "Enviando Dados";

  var name = MyPetInfoFirst().getName();
  var breedId = MyPetInfoSecond().getIdBreeds();
  var genere = MyPetInfoFirst().getIdGender();
  var dateBirth = MyPetInfoSecond().getBirthDatePet();
  var coatColorId = MyPetInfoSecond().getCoatColors();
  var size = MyPetInfoThird().getSizePet();
  var castrated = MyPetInfoThird().getStatusCastration();
  var microchipSerial = MyPetInfoThird().getMicrochip();

  sendData() async {
    var dataError = "Falhou!";
    var result = await ApiRestRegMyPet.post(name, breedId, genere,
        dateBirth.toString(), coatColorId, size, castrated, microchipSerial);

    if (result == null) {
      DrawerBottonError().show(context);

      setState(() {
        _labelScreem = dataError;
      });
    } else {
      // var tutorId = result.id;
      //  var tutorEmail = result.email;
      var dataOk = "Pronto!";
      setState(() {
        //    id = tutorId;
        // email = tutorEmail;
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
                                  Navigator.pushReplacement(
                                      context, _createRoute(EndFormRegMypet()));
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
  final _labelPositive = "Agora vamos precisar de umas fotos do seu pet";
  final buttonYes = "Sim";
  final buttonLater = "OK";

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
                                  CameraInitializer().init(context);
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
