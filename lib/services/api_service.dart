import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_chatgpt/constans/api_constants.dart';

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {"Authorization": "Bearer $API_KEY"},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse["error"] != null) {
        print("jsonResponse['error'] ${jsonResponse["error"]["message"]}");
        throw HttpException(jsonResponse["error"]["message"]);
      }
      print("JsonResponse $jsonResponse");
    } catch (error) {
      print("ERROR $error");
    }
  }
}
