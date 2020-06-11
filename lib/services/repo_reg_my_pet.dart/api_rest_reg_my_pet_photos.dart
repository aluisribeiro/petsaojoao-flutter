import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../base_url.dart';

class ApiRestRegMyPetPhoto {
  static Future<bool> post(int petId, String photoUrl) async {
    var url = "$BASE_URL/pets/$petId/photos";

    var header = {"Content-Type": "application/json"};

    Map params = {'pet_id': petId, 'url': photoUrl};

    var _body = json.encode(params);
    print("Send Json : $_body");

    final http.Response response = await http
        .post(
      url,
      headers: header,
      body: _body,
    )
        .timeout(Duration(seconds: 25), onTimeout: () {
      return null;
    });

    if (response == null) {
      return null;
    } else {
      if (response.statusCode == 200) {
        Map<String, dynamic> resp = jsonDecode(response.body);
        debugPrint(resp['id'].toString());
        return true;
      } else {
        return null;
      }
    }
  }
}
