import 'dart:convert';

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
import 'package:petsaojoao/services/repo_reg_my_pet/api_rest_reg_my_pet.dart';

import 'my_pet_info_third.dart';

TextEditingController _breedController = new TextEditingController();
TextEditingController _coatColorController = new TextEditingController();
var _birthDatePetController = new MaskedTextController(mask: "00/00/0000");
var _idBreeds;
var _idCoatColors;

class MyPetInfoSecond extends StatefulWidget {
  int getIdBreeds() {
    return int.parse(_idBreeds);
  }

  int getCoatColors() {
    return int.parse(_idCoatColors);
  }

  DateTime getBirthDatePet() {
    var value = _birthDatePetController.text;
    var day = value.substring(0, 2);
    var month = value.substring(3, 5);
    var year = value.substring(6, 10);

    var dateFalse = year + "-" + month + "-" + day;
    var date = DateTime.parse(dateFalse);

    return date;
  }

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
  @override
  void dispose() {
    super.dispose();
  }

  final _myPetInfoSecondFormKey = GlobalKey<FormState>();
  final _labelbirthDate = "Data Nascimento";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _myPetInfoSecondFormKey,
      child: Column(children: <Widget>[
        DropDownBreeds(),
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
        DropDownCoatColors(),
        // TextFormField(
        //   validator: (value) {
        //     return CoatColorValidator().validate(value);
        //   },
        //   keyboardType: TextInputType.text,
        //   controller: _coatColorController,
        //   decoration: InputDecoration(
        //     prefixIcon: Icon(FontAwesomeIcons.palette),
        //     labelText: _labelCoatColor,
        //     border: OutlineInputBorder(),
        //   ),
        // ),
        SizedBox(height: 30),
        ButtonConfirmForm(() {
          if (_myPetInfoSecondFormKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyPetInfoThird()));
          }
        }),
      ]),
    ));
  }
}

class DropDownBreeds extends StatefulWidget {
  @override
  _DropDownBreedsState createState() => _DropDownBreedsState();
}

class _DropDownBreedsState extends State<DropDownBreeds> {
  final _labelBreed = "Raça";

  List<DropdownMenuItem<String>> listDropBreeds = [];

  _getBreeds() async {
    var resp = await ApiRestRegMyPet.getBreeds();

    for (var prop in resp) {
      setState(() {
        var _idBreed = prop['id'].toString();
        var _nameBreed = prop['name'];
        listDropBreeds.add(DropdownMenuItem(
            value: _idBreed,
            child: Text(
              _nameBreed,
              style: TextStyle(
                color: Colors.black54,
              ),
            )));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBreeds();
    setState(() {
      _idBreeds = null;
    });
  }

  void _selectBreeds(value) {
    setState(() {
      _breedController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DropdownButtonFormField<String>(
        value: _idBreeds,
        items: listDropBreeds,
        validator: (value) {
          return BreedValidator().validate(value);
        },
        onChanged: (value) {
          setState(() {
            _idBreeds = value;
            _selectBreeds(value);
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.globe),
          labelText: _labelBreed,
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}

class DropDownCoatColors extends StatefulWidget {
  @override
  _DropDownCoatColorsState createState() => _DropDownCoatColorsState();
}

class _DropDownCoatColorsState extends State<DropDownCoatColors> {
  final _labelCoatColors = "Cor da Pelagem";

  List<DropdownMenuItem<String>> listDropCoatColors = [];

  _getCoatColor() async {
    var resp = await ApiRestRegMyPet.getCoatColors();

    for (var prop in resp) {
      setState(() {
        var _idCoatColors = prop['id'].toString();
        var _nameCoatColors = prop['name'];
        listDropCoatColors.add(DropdownMenuItem(
            value: _idCoatColors,
            child: Text(
              _nameCoatColors,
              style: TextStyle(
                color: Colors.black54,
              ),
            )));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCoatColor();
    setState(() {
      _idCoatColors = null;
    });
  }

  void _selectCoatColors(value) {
    setState(() {
      _coatColorController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DropdownButtonFormField<String>(
        value: _idCoatColors,
        items: listDropCoatColors,
        validator: (value) {
          return CoatColorValidator().validate(value);
        },
        onChanged: (value) {
          print(value);
          setState(() {
            _idCoatColors = value;
            _selectCoatColors(value);
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.palette),
          labelText: _labelCoatColors,
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}
