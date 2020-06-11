import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petsaojoao/services/repo_reg_tutor/standard_tutor.dart';
import 'dart:async';
import '../base_url.dart';

class ApiRestTutor {
  static Future<StandardTutor> post(
      String email,
      String name,
      String rg,
      String cpf,
      String phone,
      String whatsapp,
      String cep,
      String street,
      String number,
      String area,
      String complement) async {
    var url = "$BASE_URL/tutors";

    var header = {"Content-Type": "application/json"};

    Map params = {
      'email': email,
      'name': name,
      'rg': rg,
      'cpf': cpf,
      'phone': phone,
      'whatsapp': whatsapp,
      'cep': cep,
      'street': street,
      'number': number,
      'area': area,
      'complement': complement
    };

    var _body = json.encode(params);
    print("Send Json : $_body");

    final http.Response response = await http
        .post(
      url,
      headers: header,
      body: _body,
    )
        .timeout(Duration(seconds: 10), onTimeout: () {
      return null;
    });

    if (response == null) {
      return null;
    } else {
      if (response.statusCode == 200) {
        //print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        Map<String, dynamic> resp = jsonDecode(response.body);
        debugPrint(resp['id'].toString());
        var _id = resp['id'].toString();
        var _email = resp['email'].toString();
        // StandardTutor().setId(int.parse(_id));

        // print('Response  ID...............: ${response.id}');

        //Map mapResponse = json.decode(response.body);

        //String mensagem = mapResponse["message"];

        //print("message $mensagem");
        return StandardTutor(int.parse(_id), _email);
      } else {
        return null;
      }
    }
  }
}