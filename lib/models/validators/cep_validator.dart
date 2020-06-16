import 'package:path/path.dart';
import 'package:petsaojoao/components/register_tutor/alert_error.dart';
import 'package:via_cep/via_cep.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/register_tutor/andress_info.dart';

class CepValidador {
  final citySaoJoao = "São João da Boa Vista";

  String validate(context, String value, city) {
    const requiredField = "O campo é obrigatorio";
    const cepInvalid = "CEP inválido";
    if (city != citySaoJoao) {
      return cepInvalid;
    } else if (value.isEmpty) {
      return requiredField;
    } else {
      return null;
    }
  }

  Future searchingCep(String value, context) async {
    final icon = Icons.place;
    final title = "CEP Inválido";
    final content =
        "Desculpe, no momento só aceitamos CEP's do município de São João da Boa Vista - SP";
    final cepNotFound = "CEP not Found";

    var cep = new via_cep();

    var result = await cep.searchCEP(value, 'json', '');

    if (cep.getResponse() == 200) {
      if (cep.getLocalidade() != citySaoJoao) {
        AlertError(icon, title, content).showAlert(context);
        FormAndress().setAndress(null, null, cep.getLocalidade());
      } else {
        FormAndress().setAndress(
            cep.getLogradouro(), cep.getBairro(), cep.getLocalidade());
      }
    } else {
      FormAndress().setAndress(null, null, cepNotFound);
    }
  }
}
