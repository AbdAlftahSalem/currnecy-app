import 'dart:convert';
import 'package:http/http.dart' as http;

import '../const.dart';

class API {
  Future getData() async {
    var response = await http.get(
        '$baseLink=$apiKeys');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error");
    }
  }
}
