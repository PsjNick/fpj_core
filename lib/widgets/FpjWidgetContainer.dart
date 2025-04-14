import 'package:flutter/material.dart';

class FpjWidgetContainer extends StatelessWidget {
  final Color? color;
  final double? width,
      elevation,
      height,
      size,
      radius,
      radiusTopL,
      radiusTopR,
      radiusBottomL,
      radiusBottomR,
      paddingAll,
      paddingVer,
      paddingHor,
      paddingTop,
      paddingBtm,
      paddingL,
      paddingR;
  final BoxConstraints? constraints;
  final Widget? child;
  final DecorationImage? image;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape shape;
  final AlignmentGeometry? alignment;

  final GestureTapCallback? onTap;

  const FpjWidgetContainer({
    super.key,
    this.paddingAll,
    this.paddingVer,
    this.paddingHor,
    this.paddingL,
    this.paddingTop,
    this.elevation,
    this.paddingR,
    this.paddingBtm,
    this.onTap,
    this.width,
    this.alignment,
    this.height,
    this.size,
    this.constraints,
    this.child,
    this.color,
    this.image,
    this.border,
    this.radius,
    this.radiusTopL,
    this.radiusTopR,
    this.radiusBottomL,
    this.radiusBottomR,
    this.boxShadow,
    this.gradient,
    this.backgroundBlendMode,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius? _borderRadius = radius != null
        ? BorderRadius.circular(radius!)
        : BorderRadius.only(
            topLeft: Radius.circular(radiusTopL ?? 0),
            topRight: Radius.circular(radiusTopR ?? 0),
            bottomLeft: Radius.circular(radiusBottomL ?? 0),
            bottomRight: Radius.circular(radiusBottomR ?? 0),
          );

    if (shape == BoxShape.circle) {
      _borderRadius = null;
    }

    Decoration _decoration = BoxDecoration(
      image: image,
      border: border,
      color: color,

      borderRadius: _borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );

    return Material(
      color: color ?? Colors.transparent,
      borderRadius: _borderRadius,
      elevation: elevation ?? 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: _borderRadius,
        child: Container(
          alignment: alignment,
          width: width ?? size,
          height: height ?? size,
          constraints: constraints,
          decoration: _decoration,
          child: child,
          padding: EdgeInsets.only(
            left: paddingAll ?? paddingHor ?? paddingL ?? 0,
            top: paddingAll ?? paddingVer ?? paddingTop ?? 0,
            right: paddingAll ?? paddingHor ?? paddingR ?? 0,
            bottom: paddingAll ?? paddingVer ?? paddingBtm ?? 0,
          ),
        ),
      ),
    );
  }
}
