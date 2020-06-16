import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petsaojoao/models/dashboard/analytics.dart';
import 'dart:async';
import '../base_url.dart';

class ApiRestAnalytics {
  static Future<Analytics> all() async {
    var url = "$BASE_URL/analytics";
    var header = {"Content-Type": "application/json"};

    try {
      final http.Response response = await http
          .get(url, headers: header)
          .timeout(Duration(seconds: 3), onTimeout: () {
        throw Exception('Failed to load analytics');
      });

      if (response != null && response.statusCode == 200) {
        return Analytics.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load analytics');
      }
    } on Exception catch (_) {
      return Analytics(0, 0, 0, 0, 0, 0);
    }
  }
}
