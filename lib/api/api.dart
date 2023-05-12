import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const serverUrl = "http://localhost:5000";

  static Future<Map> predictCancerStage(String imgBase64) async {
    final result = await http.post(Uri.parse('$serverUrl/api/core/predict'),
        body: {"image_base64": imgBase64});
    return jsonDecode(result.body);
  }

  static Future<Map> trainSvmModel() async {
    final result = await http.post(
        Uri.parse('$serverUrl/api/models/cancer_detection_model/train'),
        body: <String, String>{
          "pretraining_preprocessing_enabled": true.toString(),
          "update_stored_model": false.toString()
        });
    return jsonDecode(result.body);
  }

  static Future<Map> trainSvrModel() async {
    final result = await http.post(
        Uri.parse('$serverUrl/api/models/severity_prediction_model/train'));
    return jsonDecode(result.body);
  }
}
