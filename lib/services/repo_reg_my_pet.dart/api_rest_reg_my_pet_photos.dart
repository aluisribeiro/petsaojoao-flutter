import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petsaojoao/services/repo_reg_my_pet.dart/standard_pet_photo.dart';
import 'dart:async';
import '../base_url.dart';

class ApiRestRegMyPetPhoto {
  static Future<StandardPetPhoto> post(int petId, String photoUrl) async {
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
        print('Response body: ${response.body}');
        Map<String, dynamic> resp = jsonDecode(response.body);
        debugPrint(resp['id'].toString());
        var _id = resp['id'].toString();
        var _photoUrl = resp['url'].toString();
        return StandardPetPhoto(int.parse(_id), _photoUrl);
      } else {
        return null;
      }
    }
  }
}
