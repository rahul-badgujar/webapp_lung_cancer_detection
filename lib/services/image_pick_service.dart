import 'dart:convert';
import 'dart:typed_data';

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

  static Future<String?> pickImageAsBase64String() async {
    final imgBytes = await pickImageAsBytes();
    if (imgBytes != null) {
      return base64Encode(imgBytes);
    }
    return Future.value(null);
  }
}
