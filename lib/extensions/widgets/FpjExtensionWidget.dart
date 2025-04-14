import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:fpj_core/fpj_cores.dart';
import 'package:get/get.dart';

extension FpjExtensionWidget on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget onTap(GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Widget onTapWithInk(
    GestureTapCallback onTap, {
    Color? hoverColor,
    Color? splashColor,
    double? radius,
    double? radiusTopLeft,
    double? radiusTopRight,
    double? radiusBottomLeft,
    double? radiusBottomRight,
  }) {
    var borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radius ?? radiusTopLeft ?? 0),
      topRight: Radius.circular(radius ?? radiusTopRight ?? 0),
      bottomLeft: Radius.circular(radius ?? radiusBottomLeft ?? 0),
      bottomRight: Radius.circular(radius ?? radiusBottomRight ?? 0),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: InkWell(
        radius: radius,
        borderRadius: borderRadius,
        onTap: onTap,
        hoverColor: hoverColor ?? Colors.black.withAlpha(10),
        splashColor: splashColor,
        child: this,
      ),
    );
  }

  Widget widgetBadgeNum(int num, {badges.BadgeStyle? style}) {
    return badges.Badge(
      badgeContent: num.toString().toTextWidget().textColor(Colors.white),
      badgeStyle: style ?? const badges.BadgeStyle(),
      badgeAnimation: const badges.BadgeAnimation.fade(),
      child: this,
    );
  }

  Widget obx() {
    return Obx(() {
      return this;
    });
  }

  Positioned positioned({
    double? left,
    right,
    top,
    bottom,
  }) {
    return Positioned(
      child: this,
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );
  }

  Widget colorBg(Color color) {
    return Material(
      color: color,
      child: this,
    );
  }

  Widget clipRadius(double radius){
    return ClipRRect(
      child: this,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
