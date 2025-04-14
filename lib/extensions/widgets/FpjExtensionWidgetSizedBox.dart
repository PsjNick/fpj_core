import 'package:flutter/material.dart';

extension FpjExtensionWidgetSizedBox on SizedBox {
  Widget sizedBoxChild({required Widget child}) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
