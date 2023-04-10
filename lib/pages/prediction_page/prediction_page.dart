import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../resources/colors_pallet.dart';
import '../../utils/ui_utils.dart';

class PredictionPage extends StatelessWidget {
  PredictionPage({super.key, required this.imageBytes});
  final Uint8List imageBytes;
  final PageController flowPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: PageView(
                  controller: flowPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text("1"),
                    Text("2"),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildFlowForwadingIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }

  Widget _buildFlowForwadingIcon(BuildContext context) {
    final buttonRadius = UiUtils.getPercentageWidth(context, 6);
    return GestureDetector(
      onTap: () async {
        await gotoNextFlow();
      },
      child: CircleAvatar(
        backgroundColor: ColorPalette.primaryColor,
        radius: buttonRadius,
        child: Center(
          child: Icon(
            Icons.navigate_next,
            size: buttonRadius * 0.8,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> gotoNextFlow() async {
    await flowPageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
