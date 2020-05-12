import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/birth_date_validator.dart';
import 'package:petsaojoao/models/validators/breed_validator.dart';
import 'package:petsaojoao/models/validators/coat_color_validator.dart';

import 'my_pet_info_third.dart';

TextEditingController _breedController = new TextEditingController();
TextEditingController _coatColorController = new TextEditingController();
var _birthDatePetController = new MaskedTextController(mask: "00/00/0000");

class MyPetInfoSecond extends StatefulWidget {
  @override
  _MyPetInfoSecondState createState() => _MyPetInfoSecondState();
}

class _MyPetInfoSecondState extends State<MyPetInfoSecond> {
  String steps = "2 de 3";
  String questionTittle = 'Conhecendo seu Pet';
  var arrowBackIcon = Icons.arrow_back;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarFoundation(arrowBackIcon),
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
            child: FormMyPetInfoSecond(),
          ),
        ]));
  }
}

class FormMyPetInfoSecond extends StatefulWidget {
  @override
  _FormMyPetInfoSecondState createState() => _FormMyPetInfoSecondState();
}

class _FormMyPetInfoSecondState extends State<FormMyPetInfoSecond> {
  final _myPetInfoSecondFormKey = GlobalKey<FormState>();
  final _labelBreed = "Raça";
  final _labelbirthDate = "Data Nascimento";
  final _labelCoatColor = "Cor da Pelagem";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _myPetInfoSecondFormKey,
      child: Column(children: <Widget>[
        TextFormField(
          validator: (value) {
            return BreedValidator().validate(value);
          },
          keyboardType: TextInputType.text,
          controller: _breedController,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.globe),
            labelText: _labelBreed,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            return BirthDateValidator().validate(value);
          },
          keyboardType: TextInputType.number,
          controller: _birthDatePetController,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.calendarAlt),
            labelText: _labelbirthDate,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            return CoatColorValidator().validate(value);
          },
          keyboardType: TextInputType.text,
          controller: _coatColorController,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.palette),
            labelText: _labelCoatColor,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        ButtonConfirmForm(() {
          if (_myPetInfoSecondFormKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyPetInfoThird()));
          }
        })
      ]),
    ));
  }
}
