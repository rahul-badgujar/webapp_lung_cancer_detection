import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../utils/ui_utils.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key, required this.imageBytes});
  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.memory(
              imageBytes,
              height: UiUtils.getPercentageWidth(context, 18),
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
