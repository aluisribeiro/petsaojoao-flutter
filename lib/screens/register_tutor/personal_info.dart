import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/cpf_validator.dart';
import 'package:petsaojoao/models/validators/full_name_validator.dart';
import 'package:petsaojoao/models/validators/rg_validator.dart';

import 'andress_info.dart';

TextEditingController _nameController = new TextEditingController();
var _rgController = new MaskedTextController(mask: '00.000.000');
var _cpfController = new MaskedTextController(mask: '000.000.000-00');

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String steps = "1 de 3";
  String questionTittle = "Quem é você?";
  var exitIcon = Icons.clear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarFoundation(exitIcon),
            preferredSize: Size.fromHeight(50.0)),
        body: ListView(children: <Widget>[
          BodyFoundation(steps, questionTittle),
          SizedBox(height: 10.0),
          DataSecurityInfo(),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: FormPersonal(),
          ),
        ]));
  }
}

Route dashboard() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PersonalInfo(),
    transitionDuration: const Duration(milliseconds: 500),
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

class FormPersonal extends StatefulWidget {
  String getName() {
    return _nameController.text;
  }

  String getRg() {
    _rgController.updateMask("00000000");
    var rg = _rgController.text;
    _rgController.updateMask("00.000.000");
    return rg;
  }

  String getCpf() {
    _cpfController.updateMask("00000000000");
    var cpf = _cpfController.text;
    _cpfController.updateMask("000.000.000-00");
    return cpf;
  }

  @override
  _FormPersonalState createState() => _FormPersonalState();
}

class _FormPersonalState extends State<FormPersonal> {
  final _personalFormKey = GlobalKey<FormState>();

  final _labelName = "Nome completo";
  final _labelRg = "RG";
  final _labelCpf = "CPF";

  FocusNode focusNameForRg;
  FocusNode foucusRgForCpf;

  void initState() {
    super.initState();

    focusNameForRg = FocusNode();
    foucusRgForCpf = FocusNode();
  }

  void dispose() {
    super.dispose();

    focusNameForRg.dispose();
    foucusRgForCpf.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _personalFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onEditingComplete: focusNameForRg.requestFocus,
                validator: (value) {
                  return FullNameValidator().validate(value);
                },
                keyboardType: TextInputType.text,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: _labelName,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onEditingComplete: foucusRgForCpf.requestFocus,
                focusNode: focusNameForRg,
                validator: (value) {
                  return RgValidator().validate(value);
                },
                keyboardType: TextInputType.number,
                controller: _rgController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.picture_in_picture),
                  labelText: _labelRg,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                focusNode: foucusRgForCpf,
                validator: (value) {
                  return CpfValidator().validate(value);
                },
                keyboardType: TextInputType.number,
                controller: _cpfController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.picture_in_picture),
                  labelText: _labelCpf,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              ButtonConfirmForm(() {
                if (_personalFormKey.currentState.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AndressInfo()));
                }
              }),
            ],
          )),
    );
  }
}
