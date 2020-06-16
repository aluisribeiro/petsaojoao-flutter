import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/castration_validator.dart';
import 'package:petsaojoao/models/validators/microchip_validator.dart';
import 'package:petsaojoao/models/validators/size_pet_validator.dart';

import 'end_form_reg_my_pet.dart';

TextEditingController _sizePetController = new TextEditingController();
TextEditingController _castrationController = new TextEditingController();
TextEditingController _microchipController = new TextEditingController();
var _idSizePet;
var _statusCastration;

class MyPetInfoThird extends StatefulWidget {
  String getSizePet() {
    return _idSizePet;
  }

  bool getStatusCastration() {
    if (_statusCastration == "true") {
      return true;
    } else {
      return false;
    }
  }

  String getMicrochip() {
    return _microchipController.text;
  }

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
                  MaterialPageRoute(builder: (context) => EndFormRegMypet()));
              //CameraInitializer().init(context);
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
          FontAwesomeIcons.expandAlt,
          color: Colors.black54,
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
      value: 'G',
    ));
    listDropSizePet.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.arrowsAltH,
          color: Colors.black54,
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
      value: "M",
    ));
    listDropSizePet.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.compressAlt,
          color: Colors.black54,
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
      value: "P",
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
    return DropdownButtonFormField<String>(
      value: _idSizePet,
      items: listDropSizePet,
      validator: (value) {
        return SizePetValidator().validate(value);
      },
      onChanged: (value) {
        setState(() {
          _idSizePet = value;
          _selectSizePet(value);
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.arrowsAltV),
        labelText: _labelSizePet,
        border: OutlineInputBorder(),
      ),
    );
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
      value: 'true',
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
      value: 'false',
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
    return DropdownButtonFormField<String>(
      value: _statusCastration,
      items: listDropCastration,
      validator: (value) {
        return CastrationValidator().validate(value);
      },
      onChanged: (value) {
        print(value);
        setState(() {
          _statusCastration = value;
          _selectCastration(value);
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.heartbeat),
        labelText: _labelCastration,
        border: OutlineInputBorder(),
      ),
    );
  }
}
