import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/foundation_form/button_confirmForm.dart';
import 'package:petsaojoao/components/foundation_form/data_security_info.dart';
import 'package:petsaojoao/models/validators/email_validator.dart';
import 'package:petsaojoao/models/validators/phone_validator.dart';
import 'package:petsaojoao/models/validators/whatsapp_validator.dart';

import 'end_register_tutor.dart';

TextEditingController _emailController = new TextEditingController();
var _phoneController = new MaskedTextController(mask: "(00) 0000-00000");
var _whatsappController = new MaskedTextController(mask: "(00) 0 0000-0000");

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  String steps = "3 de 3";
  String questionTittle = "Como te contactamos?";
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
            child: FormContact(),
          ),
        ]));
  }
}

class FormContact extends StatefulWidget {
  @override
  _FormContactState createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  final _contactFormKey = GlobalKey<FormState>();

  final _labelEmail = "E-mail";
  final _labelPhone = "Telefone";
  final _labelWhatsapp = "Whatsapp";
  final _helperTextOptional = "Opcional";

  FocusNode focusEmailForPhone;
  FocusNode focusPhoneForWhatsapp;

  void initState() {
    super.initState();

    focusEmailForPhone = FocusNode();
    focusPhoneForWhatsapp = FocusNode();
  }

  void dispose() {
    super.dispose();

    focusEmailForPhone.dispose();
    focusPhoneForWhatsapp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _contactFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onEditingComplete: focusEmailForPhone.requestFocus,
            validator: (value) {
              return EmailValidator().validate(value);
            },
            keyboardType: TextInputType.text,
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: _labelEmail,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            onEditingComplete: focusPhoneForWhatsapp.requestFocus,
            focusNode: focusEmailForPhone,
            validator: (value) {
              return PhoneValidator().validate(value);
            },
            onChanged: (value) {
              if (_phoneController.text.length == 15) {
                _phoneController.updateMask("(00) 0 0000-0000");
              }
            },
            keyboardType: TextInputType.number,
            controller: _phoneController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: _labelPhone,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            focusNode: focusPhoneForWhatsapp,
            validator: (value) {
              return WhatsappValidator().validate(value);
            },
            keyboardType: TextInputType.number,
            controller: _whatsappController,
            decoration: InputDecoration(
              helperText: _helperTextOptional,
              prefixIcon: Icon(FontAwesomeIcons.whatsapp),
              labelText: _labelWhatsapp,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 30),
          ButtonConfirmForm(() {
            if (_contactFormKey.currentState.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EndRegisterTutor()));
            }
          }),
        ],
      ),
    );
  }
}
