import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/utils/ui_utils.dart';

class Values {
  static const defaultCornerRadius = 16.0;

  static EdgeInsets getDefaultPagePaddding(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: UiUtils.getPercentageWidth(context, 3),
        vertical: UiUtils.getPercentageHeight(context, 4));
  }
}
