import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/castration_validator.dart';
import 'package:petsaojoao/models/validators/microchip_validator.dart';
import 'package:petsaojoao/models/validators/size_pet_validator.dart';

import 'initial_pics_pet.dart';

TextEditingController _sizePetController = new TextEditingController();
TextEditingController _castrationController = new TextEditingController();
TextEditingController _microchipController = new TextEditingController();

class MyPetInfoThird extends StatefulWidget {
  @override
  _MyPetInfoThirdState createState() => _MyPetInfoThirdState();
}

class _MyPetInfoThirdState extends State<MyPetInfoThird> {
  String steps = "3 de 3";
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
            child: FormMyPetInfoThird(),
          ),
        ]));
  }
}

class FormMyPetInfoThird extends StatefulWidget {
  @override
  _FormMyPetInfoThirdState createState() => _FormMyPetInfoThirdState();
}

class _FormMyPetInfoThirdState extends State<FormMyPetInfoThird> {
  final _myPetInfoThirdFormKey = GlobalKey<FormState>();
  final _labelMicrochip = "Número do Microchip";
  final _labelHelperOptional = "Opcional";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _myPetInfoThirdFormKey,
        child: Column(children: <Widget>[
          DropDownSizePet(),
          SizedBox(
            height: 20,
          ),
          DropDownCastration(),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              return MicrochipValidator().validate(value);
            },
            keyboardType: TextInputType.number,
            controller: _microchipController,
            decoration: InputDecoration(
              prefixIcon: Icon(FontAwesomeIcons.microchip),
              labelText: _labelMicrochip,
              helperText: _labelHelperOptional,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ButtonConfirmForm(() {
            if (_myPetInfoThirdFormKey.currentState.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InititialPicsPet()));
            }
          })
        ]),
      ),
    );
  }
}

class DropDownSizePet extends StatefulWidget {
  @override
  _DropDownSizePetState createState() => _DropDownSizePetState();
}

class _DropDownSizePetState extends State<DropDownSizePet> {
  final _labelSizePet = "Porte";
  final _labelLarge = "Grande";
  final _labelMedium = "Médio";
  final _labelSmall = "Pequeno";

  List<DropdownMenuItem<String>> listDropSizePet = [];

  void loadDataSizePet() {
    listDropSizePet = [];

    listDropSizePet.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.dog,
          color: Colors.black54,
          size: 40,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelLarge,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelLarge,
    ));
    listDropSizePet.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.dog,
          color: Colors.black54,
          size: 30,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelMedium,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelMedium,
    ));
    listDropSizePet.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.dog,
          color: Colors.black54,
          size: 20,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelSmall,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelSmall,
    ));
  }

  void _selectSizePet(value) {
    setState(() {
      _sizePetController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadDataSizePet();
    return TextFormField(
        enabled: true,
        controller: _sizePetController,
        readOnly: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          return SizePetValidator().validate(_sizePetController.text);
        },
        decoration: InputDecoration(
          prefixIcon:
              Icon(FontAwesomeIcons.arrowsAltV), //FontAwesomeIcons.paw),
          labelText: _labelSizePet,
          border: OutlineInputBorder(),
          suffixIcon: Container(
              width: 200,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      iconSize: 40,
                      items: listDropSizePet,
                      onChanged: (value) => _selectSizePet(value)))),
        ));
  }
}

class DropDownCastration extends StatefulWidget {
  @override
  _DropDownCastrationState createState() => _DropDownCastrationState();
}

class _DropDownCastrationState extends State<DropDownCastration> {
  final _labelCastration = "Seu animal é castrado?";
  final _labelYes = "Sim";
  final _labeNo = "Não";

  List<DropdownMenuItem<String>> listDropCastration = [];

  void loadDataCastration() {
    listDropCastration = [];

    listDropCastration.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.checkCircle,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labelYes,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labelYes,
    ));
    listDropCastration.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.timesCircle,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          _labeNo,
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: _labeNo,
    ));
  }

  void _selectCastration(value) {
    setState(() {
      _castrationController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadDataCastration();
    return TextFormField(
        enabled: true,
        controller: _castrationController,
        readOnly: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          return CastrationValidator().validate(_castrationController.text);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.heartbeat), //FontAwesomeIcons.paw),
          labelText: _labelCastration,
          border: OutlineInputBorder(),
          suffixIcon: Container(
              width: 140,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      iconSize: 40,
                      items: listDropCastration,
                      onChanged: (value) => _selectCastration(value)))),
        ));
  }
}
