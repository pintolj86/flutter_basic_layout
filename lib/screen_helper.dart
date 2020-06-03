import 'package:flutter/material.dart';

/// This class is a helper utility to get device screeb size info.
class ScreenHelper {
  ///Returns True if [context] is portrait

  static bool isPortrait(BuildContext context) {
      return MediaQuery.of(context).orientation == Orientation.portrait;
  }
    ///Returns True if [context] is landscape
  static bool isLandScape(BuildContext context) {
      return MediaQuery.of(context).orientation == Orientation.landscape;
  }
    ///Returns True if [context] is a small layout, (with <800)
  static bool isSmallLayout(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }
   ///Returns True if [context] is width between 800 and 1200.
  static bool isMediumLayout(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 && MediaQuery.of(context).size.width < 1200;
  }
   ///Returns True if [context] is a large layout, (with > 1200)
  static bool isLargeLayout(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}