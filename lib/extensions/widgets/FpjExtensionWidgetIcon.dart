import 'package:flutter/cupertino.dart';

extension FpjExtensionWidgetIcon on Icon {
  Icon iconSize(double size) {
    return Icon(
      this.icon,
      size: size,
      color: this.color,
      fill: this.fill,
      weight: this.weight,
      grade: this.grade,
      opticalSize: this.opticalSize,
      shadows: this.shadows,
      semanticLabel: this.semanticLabel,
      textDirection: this.textDirection,
      applyTextScaling: this.applyTextScaling,
    );
  }

  Icon iconColor(Color color) {
    return Icon(
      this.icon,
      color: color,
      size: this.size,
      fill: this.fill,
      weight: this.weight,
      grade: this.grade,
      opticalSize: this.opticalSize,
      shadows: this.shadows,
      semanticLabel: this.semanticLabel,
      textDirection: this.textDirection,
      applyTextScaling: this.applyTextScaling,
    );
  }
}
