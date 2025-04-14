///  create by —— jie
///  2024/12/27 09:41

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class FpjWidgetImageSvg extends StatelessWidget {
  final String url;
  final double? w, h, size;
  final Color? color;
  final ui.BlendMode ? colorBlendMode;


  const FpjWidgetImageSvg({super.key, required this.url, this.colorBlendMode,this.w, this.h, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    if (url.startsWith("http")) {
      final Widget networkSvg = SvgPicture.network(
        width: size ?? w,
        height: size ?? h,
        url,
        placeholderBuilder: (BuildContext context) => SizedBox(),
      );

      return networkSvg;
    }

    final Widget svg = SvgPicture.asset(
      url,
      width: size ?? w,
      colorFilter: _getColorFilter(color, colorBlendMode ?? ui.BlendMode.srcIn),
      height: size ?? h,
    );

    return svg;
  }

  ColorFilter? _getColorFilter(ui.Color? color, ui.BlendMode colorBlendMode) => color == null ? null : ui.ColorFilter.mode(color, colorBlendMode);
}
