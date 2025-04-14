import 'package:flutter/material.dart';

extension FpjExtensionWidgetText on Text {



  Text textColor(Color color) {

    return Text(
      data ?? "",
      style: (style ?? const TextStyle()).copyWith(
        color: color,
      ),
    );

  }

  Text fontSize(double size) {

    return Text(
      data ?? "",
      style: (style ?? const TextStyle()).copyWith(
        fontSize: size,
      ),
    );

  }

  Text height(double height){

    return Text(
      data ?? "",
      style: (style ?? const TextStyle()).copyWith(
        height: height,
      ),
    );

  }



}
