import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickService {
  static Future<Uint8List?> pickImageAsBytes() async {
    final imgPicker = ImagePicker();
    final image = await imgPicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imgBytes = await image.readAsBytes();
      return imgBytes;
    }
    return Future.value(null);
  }
}
