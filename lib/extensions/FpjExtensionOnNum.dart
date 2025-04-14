import 'package:flutter/material.dart';
import 'package:fpj_core/fpj_cores.dart';

extension FpjExtensionOnNum on num {
  SizedBox sizedBox({Widget ? child,}) {
    return SizedBox(
      width: this.toDouble(),
      height: this.toDouble(),
      child: child,
    );
  }

  Container container({
    Widget? child,
    Decoration ? decoration,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      alignment: alignment,
      decoration: decoration,
      width: this.toDouble(),
      height: this.toDouble(),
      child: child,
    );
  }

  Gap gap() {
    return Gap(toDouble());
  }
}
