import 'dart:ui' as ui;
import 'package:flutter/material.dart';

MediaQueryData _mediaQueryData = MediaQueryData.fromView(ui.window);

const num FIGMA_DESIGN_WIDTH = 428;
const num FIGMA_DESIGN_HEIGHT = 926;
const num FIGMA_DESIGN_STATUS_BAR = 0;

extension Responsive on num {
  get _width => _mediaQueryData.size.width;
  get _height {
    num statusBar = _mediaQueryData.padding.top;
    num bottomBar = _mediaQueryData.padding.bottom;
    num height = _mediaQueryData.size.height - statusBar - bottomBar;
    return height;
  }

  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
  double get v =>
      ((this * _height) / FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);

  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  double get sp => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }
}
