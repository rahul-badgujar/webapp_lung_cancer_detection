import 'dart:typed_data';

import 'package:flutter/material.dart';

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
                flex: 3,
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
                flex: 1,
                child: _buildFlowForwadingIcon(),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }

  Widget _buildFlowForwadingIcon() {
    return IconButton(
      onPressed: () async {
        await gotoNextFlow();
      },
      icon: const Icon(
        Icons.navigate_next_rounded,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
    );
  }

  Future<void> gotoNextFlow() async {
    await flowPageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
