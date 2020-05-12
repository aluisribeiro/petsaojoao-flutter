import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/cep_validator.dart';
import 'package:petsaojoao/models/validators/house_number_validator.dart';
import 'package:petsaojoao/models/validators/neighborhood_validator.dart';
import 'package:petsaojoao/models/validators/street_validator.dart';

import 'contact_info.dart';

var _cepController = new MaskedTextController(mask: '00000-000');
TextEditingController _streetController = new TextEditingController();
TextEditingController _neighborhoodController = new TextEditingController();
TextEditingController _houseNumberController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _additionalAddressController =
    new TextEditingController();

class AndressInfo extends StatefulWidget {
  @override
  _AndressInfoState createState() => _AndressInfoState();
}

class _AndressInfoState extends State<AndressInfo> {
  String steps = "2 de 3";
  String questionTittle = "Onde você mora?";
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
            child: FormAndress(),
          ),
        ]));
  }
}

class FormAndress extends StatefulWidget {
  void setAndress(street, neighborhood, city) {
    _streetController.text = street;
    _neighborhoodController.text = neighborhood;
    _cityController.text = city;
  }

  @override
  _FormAndressState createState() => _FormAndressState();
}

class _FormAndressState extends State<FormAndress> {
  final _andressFormKey = GlobalKey<FormState>();

  final _labelCep = "CEP";
  final _labelStreet = "Logradouro";
  final _labelNeighborhood = "Bairro";
  final _labelHouseNumber = "Número";
  final _labelAdditionalAddress = "Complemento";

  var _readOnlyStreet = true;
  var _readOnlyNeighborhood = true;

  FocusNode focusCepForHouseNumber;
  FocusNode focusHouseNumberForAddAndress;

  void initState() {
    super.initState();

    focusCepForHouseNumber = FocusNode();
    focusHouseNumberForAddAndress = FocusNode();
  }

  void dispose() {
    super.dispose();

    focusCepForHouseNumber.dispose();
    focusHouseNumberForAddAndress.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _andressFormKey,
      child: Column(children: <Widget>[
        TextFormField(
          validator: (value) {
            CepValidador().searchingCep(_cepController.text, context);
            return CepValidador()
                .validate(context, value, _cityController.text);
          },
          onChanged: (value) {
            CepValidador().searchingCep(value, context);
          },
          keyboardType: TextInputType.number,
          controller: _cepController,
          onEditingComplete: focusCepForHouseNumber.requestFocus,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.place),
            suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  CepValidador().searchingCep(_cepController.text, context);
                }),
            labelText: _labelCep,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            return StreetValidator().validate(value);
          },
          readOnly: _readOnlyStreet,
          keyboardType: TextInputType.text,
          controller: _streetController,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.road),
            suffixIcon: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _readOnlyStreet = false;
                  });
                }),
            labelText: _labelStreet,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          validator: (value) {
            return NeighborhoodValidator().validate(value);
          },
          readOnly: _readOnlyNeighborhood,
          keyboardType: TextInputType.text,
          controller: _neighborhoodController,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.city),
            suffixIcon: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _readOnlyNeighborhood = false;
                  });
                }),
            labelText: _labelNeighborhood,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    return HouseNumberValidador().validate(value);
                  },
                  keyboardType: TextInputType.number,
                  controller: _houseNumberController,
                  focusNode: focusCepForHouseNumber,
                  onEditingComplete: focusHouseNumberForAddAndress.requestFocus,
                  decoration: InputDecoration(
                    helperText: " ",
                    prefixIcon: Icon(FontAwesomeIcons.home),
                    labelText: _labelHouseNumber,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    return null;
                  },
                  focusNode: focusHouseNumberForAddAndress,
                  keyboardType: TextInputType.text,
                  controller: _additionalAddressController,
                  decoration: InputDecoration(
                    helperText: " ",
                    prefixIcon: Icon(FontAwesomeIcons.home),
                    labelText: _labelAdditionalAddress,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ]),
        SizedBox(height: 30),
        ButtonConfirmForm(() {
          if (_andressFormKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactInfo()));
          }
        }),
        SizedBox(height: 20)
      ]),
    ));
  }
}
