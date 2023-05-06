import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/api/api.dart';
import 'package:lung_cancer_detection_ui/resources/values.dart';
import 'package:lung_cancer_detection_ui/widgets/labeled_image_card.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../utils/ui_utils.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key, required this.imageBase64Encoding});
  final String imageBase64Encoding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: UiUtils.getPercentageHeight(context, 12),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.home,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<Map>(
                    future: Api.predictCancerStage(imageBase64Encoding),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return _buildResultView(context, snapshot.data!);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorBasedOnStage(String stage) {
    if (stage == 'benign') {
      return Colors.yellow.shade700;
    } else if (stage == 'malignant') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  String? getStageDetails(String stage) {
    if (stage == 'benign') {
      return '''Benign tumors are not usually problematic. However, they can become large and compress structures nearby, causing pain or other medical complications.''';
    } else if (stage == 'malignant') {
      return '''Malignant tumors can spread rapidly and require treatment to avoid spread. If they are caught early, treatment is likely to be surgery with possible chemotherapy or radiotherapy. If the cancer has spread, the treatment is likely to be systemic, such as chemotherapy or immunotherapy.''';
    }
    return null;
  }

  Widget _buildResultStatusBaner(BuildContext context, Map result) {
    final predictedStage = result['predicted_stage'];
    final stageDetails = getStageDetails(predictedStage);
    return Container(
      height: UiUtils.getPercentageHeight(context, 30),
      width: double.infinity,
      color: getColorBasedOnStage(predictedStage),
      padding: EdgeInsets.symmetric(
        vertical: UiUtils.getPercentageHeight(context, 2),
        horizontal: UiUtils.getPercentageWidth(context, 3),
      ),
      child: Column(
        children: [
          Text(
            predictedStage.toString().toUpperCase(),
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: UiUtils.getPercentageHeight(context, 2),
          ),
          if (stageDetails != null)
            Text(
              stageDetails,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultView(BuildContext context, Map result) {
    final imageBoxWidth = UiUtils.getPercentageWidth(context, 16);
    return Column(
      children: [
        _buildResultStatusBaner(context, result),
        Center(
          child: _buildScaleGauge(context, result),
        ),
        const Divider(),
        Padding(
          padding: Values.getDefaultPagePaddding(context),
          child:
              _buildImageProcessingStepsOutputs(imageBoxWidth, context, result),
        ),
        SizedBox(
          height: UiUtils.getPercentageHeight(context, 12),
        ),
      ],
    );
  }

  Widget _buildScaleGauge(BuildContext context, Map<dynamic, dynamic> result) {
    final scaleValue =
        double.parse(result['predicted_scale'].toStringAsFixed(2));
    return Padding(
      padding: EdgeInsets.all(UiUtils.getPercentageWidth(context, 1)),
      child: SizedBox(
        width: UiUtils.getPercentageWidth(context, 50),
        child: SfRadialGauge(
          title: const GaugeTitle(
              text: "Severity Scale",
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              borderWidth: 1,
              borderColor: Colors.black,
              alignment: GaugeAlignment.center),
          enableLoadingAnimation: true,
          animationDuration: 1000,
          axes: <RadialAxis>[
            RadialAxis(minimum: 1, maximum: 10, pointers: <GaugePointer>[
              NeedlePointer(
                value: scaleValue,
              ),
              ..._buildScalePointers(result['scale_pointers'] as Map)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  scaleValue.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              )
            ])
          ],
        ),
      ),
    );
  }

  List<GaugePointer> _buildScalePointers(Map scalePointers) {
    return scalePointers.keys
        .map(
          (e) => WidgetPointer(
            value: scalePointers[e],
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 15,
              child: Text(
                e.toString().characters.characterAt(0).toUpperCase().toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  Widget _buildImageProcessingStepsOutputs(
      double imageBoxWidth, BuildContext context, Map result) {
    return Column(
      children: [
        LabeledImageCard(
          label: "Input CT Scan Image",
          imageBase64Encoding: result['input_image_base64'],
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
              imageBase64Encoding: result['preprocessing_output']
                  ['enhancement'],
              width: imageBoxWidth,
            ),
            LabeledImageCard(
              label: "Filtrated Image",
              imageBase64Encoding: result['preprocessing_output']['filtration'],
              width: imageBoxWidth,
            ),
            LabeledImageCard(
              label: "Segmented Image",
              imageBase64Encoding: result['preprocessing_output']
                  ['segmentation'],
              width: imageBoxWidth,
            ),
          ],
        ),
      ],
    );
  }
}
