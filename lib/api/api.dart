import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const serverUrl = "http://localhost:5000";

  static Future<Map> predictCancerStage(String imgBase64) async {
    final result = await http.post(
        Uri.parse('$serverUrl/api/models/cancer_detection_model/v1/predict'),
        body: {"image_base64": imgBase64});
    return jsonDecode(result.body);
  }
}
