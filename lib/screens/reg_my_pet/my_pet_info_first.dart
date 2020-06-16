import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/gender_validator.dart';
import 'package:petsaojoao/models/validators/name_pet_validator.dart';
import 'package:petsaojoao/models/validators/species_validator.dart';
import 'package:petsaojoao/services/repo_reg_my_pet/api_rest_reg_my_pet.dart';

import 'my_pet_info_second.dart';

TextEditingController _namePetController = new TextEditingController();
TextEditingController _speciesController = new TextEditingController();
TextEditingController _genderController = new TextEditingController();
var _idSpecies;
var _idGender;

class MyPetInfoFirst extends StatefulWidget {
  String getName() {
    return _namePetController.text;
  }

  int getIdSpecies() {
    return int.parse(_idSpecies);
  }

  String getIdGender() {
    return _idGender;
  }

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
      value: 'M',
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
      value: 'F',
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
    return DropdownButtonFormField<String>(
      value: _idGender,
      items: listDropGender,
      validator: (value) {
        return GenderValidator().validate(value);
      },
      onChanged: (value) {
        setState(() {
          _idGender = value;
          _selectGender(value);
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.venusMars),
        labelText: _labelGender,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class DropDownSpecies extends StatefulWidget {
  @override
  _DropDownSpeciesState createState() => _DropDownSpeciesState();
}

class _DropDownSpeciesState extends State<DropDownSpecies> {
  final _labelSpecie = "Espécie";

  List<DropdownMenuItem<String>> listDropSpecies = [];

  _getSpecies() async {
    var resp = await ApiRestRegMyPet.getSpecies();

    for (var prop in resp) {
      setState(() {
        var _idSpecies = prop['id'].toString();
        var _nameSpecies = prop['name'];
        var _iconsForSpecies;

        if (_nameSpecies == "Cachorro(a)") {
          _iconsForSpecies = FontAwesomeIcons.dog;
        } else {
          _iconsForSpecies = FontAwesomeIcons.cat;
        }
        listDropSpecies.add(DropdownMenuItem(
            value: _idSpecies,
            child: Row(
              children: <Widget>[
                Icon(
                  _iconsForSpecies,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  _nameSpecies,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )
              ],
            )));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getSpecies();
    setState(() {
      _idSpecies = null;
    });
  }

  void _selectSpecies(value) {
    setState(() {
      _speciesController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _idSpecies,
      items: listDropSpecies,
      validator: (value) {
        return SpeciesValidator().validate(value);
      },
      onChanged: (value) {
        setState(() {
          _idSpecies = value;
          _selectSpecies(value);
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.paw),
        labelText: _labelSpecie,
        border: OutlineInputBorder(),
      ),
    );
  }
}
