import 'package:flutter/material.dart';

extension FpjExtensionIconData on IconData {
  Icon toIcon({double? size, Color? color}) {
    return Icon(
      this,
      size: size ?? 22,
      color: color,
    );
  }

}
