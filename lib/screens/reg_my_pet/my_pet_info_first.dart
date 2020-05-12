import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/gender_validator.dart';
import 'package:petsaojoao/models/validators/name_pet_validator.dart';
import 'package:petsaojoao/models/validators/species_validator.dart';

import 'my_pet_info_second.dart';

TextEditingController _namePetController = new TextEditingController();
TextEditingController _speciesController = new TextEditingController();
TextEditingController _genderController = new TextEditingController();

class MyPetInfoFirst extends StatefulWidget {
  @override
  _MyPetInfoFirstState createState() => _MyPetInfoFirstState();
}

class _MyPetInfoFirstState extends State<MyPetInfoFirst> {
  String steps = "1 de 3";
  String questionTittle = 'Conhecendo seu Pet';
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
            child: FormMyPetInfoFirst(),
          ),
        ]));
  }
}

class FormMyPetInfoFirst extends StatefulWidget {
  @override
  _FormMyPetInfoFirstState createState() => _FormMyPetInfoFirstState();
}

class _FormMyPetInfoFirstState extends State<FormMyPetInfoFirst> {
  final _myPetInfoFirstFormKey = GlobalKey<FormState>();
  final _labelNamePet = "Nome do Pet";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _myPetInfoFirstFormKey,
          child: Column(children: <Widget>[
            TextFormField(
              validator: (value) {
                return NamePetValidator().validate(value);
              },
              keyboardType: TextInputType.text,
              controller: _namePetController,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.bone),
                labelText: _labelNamePet,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropDownSpecies(),
            SizedBox(height: 20),
            DropDownGender(),
            SizedBox(height: 30),
            ButtonConfirmForm(() {
              if (_myPetInfoFirstFormKey.currentState.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyPetInfoSecond()));
              }
            })
          ])),
    );
  }
}

class DropDownSpecies extends StatefulWidget {
  @override
  _DropDownSpeciesState createState() => _DropDownSpeciesState();
}

class _DropDownSpeciesState extends State<DropDownSpecies> {
  final _labelSpecies = "Espécie";
  final _labelDog = "Cachorro";
  final _labelCat = "Gato";

  List<DropdownMenuItem<String>> listDropSpecies = [];

  void loadDataSpecies() {
    listDropSpecies = [];

    listDropSpecies.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.dog,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelDog,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelDog,
    ));
    listDropSpecies.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.cat,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelCat,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelCat,
    ));
  }

  void _selectSpecies(value) {
    setState(() {
      _speciesController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadDataSpecies();
    return TextFormField(
        enabled: true,
        controller: _speciesController,
        readOnly: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          return SpeciesValidator().validate(_speciesController.text);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.paw), //FontAwesomeIcons.paw),
          labelText: _labelSpecies,
          border: OutlineInputBorder(),
          suffixIcon: Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      iconSize: 40,
                      items: listDropSpecies,
                      onChanged: (value) => _selectSpecies(value)))),
        ));
  }
}

class DropDownGender extends StatefulWidget {
  @override
  _DropDownGenderState createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  final _labelGender = "Gênero";
  final _labelMale = "Macho";
  final _labelFemale = "Fêmea";

  List<DropdownMenuItem<String>> listDropGender = [];

  void loadDataGender() {
    listDropGender = [];

    listDropGender.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.mars,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelMale,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelMale,
    ));
    listDropGender.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.venus,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelFemale,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelFemale,
    ));
  }

  void _selectGender(value) {
    setState(() {
      _genderController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadDataGender();
    return TextFormField(
        enabled: true,
        controller: _genderController,
        readOnly: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          return GenderValidator().validate(_speciesController.text);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.paw), //FontAwesomeIcons.paw),
          labelText: _labelGender,
          border: OutlineInputBorder(),
          suffixIcon: Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      iconSize: 40,
                      items: listDropGender,
                      onChanged: (value) => _selectGender(value)))),
        ));
  }
}
