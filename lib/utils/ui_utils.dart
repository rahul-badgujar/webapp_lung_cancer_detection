import 'package:flutter/material.dart';

class UiUtils {
  static double getPercentageWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100.0);
  }

  static double getPercentageHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100.0);
  }
}
