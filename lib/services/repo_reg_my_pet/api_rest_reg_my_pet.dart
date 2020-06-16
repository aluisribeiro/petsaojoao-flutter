import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petsaojoao/screens/reg_my_pet/my_pet_info_first.dart';
import 'package:petsaojoao/screens/register_tutor/end_register_tutor.dart';
import 'dart:async';
import '../base_url.dart';

class ApiRestRegMyPet {
  static Future<List> getSpecies() async {
    var url = BASE_URL + "/species";
    print(url);
    var header = {"Accept": "application/json"};
    final http.Response response = await http.get(
      url,
      headers: header,
    );

    List<dynamic> resp = jsonDecode(response.body);

    return resp;
  }

  static Future<List> getBreeds() async {
    var idSpecies = MyPetInfoFirst().getIdSpecies();
    var url = BASE_URL + "/species" + "/$idSpecies" + "/breeds";
    print(url);
    var header = {"Accept": "application/json"};
    final http.Response response = await http.get(
      url,
      headers: header,
    );

    List<dynamic> resp = jsonDecode(response.body);
    //print(resp);
    return resp;
  }

  static Future<List> getCoatColors() async {
    //var url = BASE_URL + "/coatColor";
    // print(url);
    // var header = {"Accept": "application/json"};
    // final http.Response response = await http.get(
    // url,
    // headers: header,
    // );

    // List<dynamic> resp = jsonDecode(response.body);

    List<dynamic> resp = [
      {'id': 1, 'name': "Branco"},
      {'id': 2, 'name': "Preto"}
    ];
    print(resp);

    return resp;
  }

  static Future<String> post(
    String name,
    int breedId,
    String genere,
    String dateBirth,
    int coatColorId,
    String size,
    bool castrated,
    String microchipSerial,
  ) async {
    print("to aqui");
    var _idTutor = EndRegisterTutor().getId();

    var url = BASE_URL + "/tutors" + "/$_idTutor" + "/pets";
    print(url);
    var header = {"Content-Type": "application/json"};

    Map params = {
      'name': name,
      'breed_id': breedId,
      'genre': genere,
      'date_birth': dateBirth,
      'coat_color_id': coatColorId,
      'size': size,
      'castrated': castrated,
      'microship_serial': microchipSerial,
      'tutor_id': _idTutor
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
        print('Response body: ${response.body}');
        Map<String, dynamic> resp = jsonDecode(response.body);
        //debugPrint(resp['id'].toString());
        var _id = resp['id'].toString();

        return _id;
      } else {
        return null;
      }
    }
  }
}
