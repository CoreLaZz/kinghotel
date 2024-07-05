import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Env {
  static String apiUrl = '';

  static Future<void> loadEnv() async {
    final String response = await rootBundle.loadString('env.json');
    final data = await json.decode(response);
    apiUrl = data['API_URL'];
  }
}
