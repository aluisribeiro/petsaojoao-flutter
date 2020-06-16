import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../base_url.dart';

class ApiRestRegister {
  static Future<bool> post(
      String email,
      String phone,
      String whatsapp) async {
    var url = "$BASE_URL/register";

    var header = {"Content-Type": "application/json"};

    Map params = {
      'email': email,
      'phone': phone,
      'whatsapp': whatsapp,
    };

    var _body = json.encode(params);
    print("Send Json : $_body");

    final http.Response response = await http
        .post(url, headers: header, body: _body)
        .timeout(Duration(seconds: 10), onTimeout: () {
      return null;
    });

    if (response == null) {
      return false;
    } else {
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }
}
