import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lung_cancer_detection_ui/pages/prediction_page/prediction_page.dart';
import 'package:lung_cancer_detection_ui/services/image_pick_service.dart';

import '../../utils/ui_utils.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          _buildBackgroundImage(),
          Positioned(
            left: UiUtils.getPercentageWidth(context, 8),
            child: Column(
              children: [
                _buildAppTitle(),
                const SizedBox(
                  height: 32,
                ),
                _buildProceedButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await onProceedClicked(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white10,
        textStyle: GoogleFonts.courierPrime(fontSize: 18),
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 24),
      ),
      child: Text(
        "Proceed".toUpperCase(),
      ),
    );
  }

  Future<void> onProceedClicked(BuildContext context) async {
    final imgEncoding = await ImagePickService.pickImageAsBase64String();
    if (imgEncoding != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionPage(
            imageBase64Encoding: imgEncoding,
          ),
        ),
      );
    }
  }

  Widget _buildAppTitle() {
    return const Text(
      "Lung Cancer Detection",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 48,
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/background/landing_page_bg.jpeg",
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
