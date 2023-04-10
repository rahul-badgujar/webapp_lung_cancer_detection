import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/resources/colors_pallet.dart';

class LabeledImageCard extends StatelessWidget {
  const LabeledImageCard(
      {super.key,
      required this.label,
      required this.imageBase64Encoding,
      required this.width});

  final String label;
  final String imageBase64Encoding;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(
          base64Decode(
            imageBase64Encoding,
          ),
          width: width,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.4,
            ),
          ),
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
