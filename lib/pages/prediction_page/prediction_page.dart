import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/resources/values.dart';
import 'package:lung_cancer_detection_ui/widgets/labeled_image.dart';

import '../../utils/ui_utils.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key, required this.imageBase64Encoding});
  final String imageBase64Encoding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _buildResultView(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultStatusBaner(BuildContext context) {
    return Container(
      height: UiUtils.getPercentageHeight(context, 30),
      color: Colors.green,
    );
  }

  Widget _buildResultView(BuildContext context) {
    final imageBoxWidth = UiUtils.getPercentageWidth(context, 16);
    return Column(
      children: [
        _buildResultStatusBaner(context),
        Padding(
          padding: Values.getDefaultPagePaddding(context),
          child: _buildImageProcessingStepsOutputs(imageBoxWidth, context),
        ),
        SizedBox(
          height: UiUtils.getPercentageHeight(context, 12),
        ),
      ],
    );
  }

  Widget _buildImageProcessingStepsOutputs(
      double imageBoxWidth, BuildContext context) {
    return Column(
      children: [
        LabeledImageCard(
          label: "Input CT Scan Image",
          imageBase64Encoding: imageBase64Encoding,
          width: imageBoxWidth,
        ),
        SizedBox(
          height: UiUtils.getPercentageHeight(context, 6),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledImageCard(
              label: "Enhanced Image",
              imageBase64Encoding: imageBase64Encoding,
              width: imageBoxWidth,
            ),
            LabeledImageCard(
              label: "Filtrated Image",
              imageBase64Encoding: imageBase64Encoding,
              width: imageBoxWidth,
            ),
            LabeledImageCard(
              label: "Segmented Image",
              imageBase64Encoding: imageBase64Encoding,
              width: imageBoxWidth,
            ),
          ],
        ),
      ],
    );
  }
}
