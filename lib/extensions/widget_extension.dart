import 'package:circular_rotation/constants/strings.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Size calculateWidgetSize() {
    assert(key is GlobalKey, Strings.elementMustBeAGlobalKey);
    return Size(
      (key as GlobalKey).currentContext?.size?.width ?? 0,
      (key as GlobalKey).currentContext?.size?.height ?? 0,
    );
  }

  /// Calculate single widget size
  /// It calculates and half size of widget by (size/2).
  Size calculateWidgetHalfSize() {
    Size _widgetSize = calculateWidgetSize();
    return Size(_widgetSize.width / 2, _widgetSize.height / 2);
  }
}
