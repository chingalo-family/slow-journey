import 'package:flutter/material.dart';

class SjLayout {
  static const compactMaxWidth = 600.0;
  static const railWidth = 220.0;
  static const tabScrollBottom = 108.0;
  static const sideNavScrollBottom = 28.0;

  static bool isLandscape(Size size) => size.width > size.height;

  static bool useSideNavigation(Size size) {
    if (isLandscape(size)) return true;
    return size.width >= compactMaxWidth;
  }

  static EdgeInsets tabBodyPaddingOf(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bottomInset = useSideNavigation(size)
        ? sideNavScrollBottom
        : tabScrollBottom;
    return EdgeInsets.fromLTRB(20, 4, 20, bottomInset);
  }
}
