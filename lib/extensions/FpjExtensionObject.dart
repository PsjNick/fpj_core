import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:oktoast/oktoast.dart';

var _logger = Logger();

extension FpjExtensionObject on Object {

  logD() {
    _logger.d(this.toString());
  }

  logE() {
    _logger.e(this.toString());
  }

  logI() {
    _logger.i(this.toString());
  }

  logW() {
    _logger.w(this.toString());
  }

  Text toTextWidget({
    TextStyle ? style,
    int ? maxLines,
    Color ? color,
    TextOverflow? overflow,
    double ? fontSize,
    TextAlign? textAlign,
  }) {
    return Text(
      toString(),
      style: (style ?? TextStyle()).copyWith(
        overflow: overflow,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  toast({
    bool clearAllTast = true,
    Color ? bgColor,
    ToastPosition position = ToastPosition.bottom,
  }) {
    if (clearAllTast) {
      dismissAllToast();
    }

    if (this is Widget) {
      showToastWidget(
        this as Widget,
        position: position,
      );
      return;
    }

    showToast(
      this.toString(),
      position: position,
      backgroundColor: bgColor,
    );
  }


}
