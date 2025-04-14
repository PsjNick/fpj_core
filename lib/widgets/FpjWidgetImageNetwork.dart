import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

typedef GesterTapImage = Function(String imageUrl);

class FpjWidgetImageNetwork extends StatelessWidget {
  final String imageUrl;

  final LoadingErrorWidgetBuilder? errorWidgetBuilder;
  final PlaceholderWidgetBuilder? placeholderWidgetBuilder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  final BoxFit? fit;
  final double? size, width, height, radius, radiusTopL, radiusTopR,
      radiusBottomL, radiusBottomR;

  final GesterTapImage? onTapImage;

  const FpjWidgetImageNetwork({
    required this.imageUrl,
    this.placeholderWidgetBuilder,
    this.errorWidgetBuilder,
    this.progressIndicatorBuilder,
    this.fit = BoxFit.cover,
    this.radius,
    this.radiusTopL,
    this.radiusTopR,
    this.radiusBottomL,
    this.radiusBottomR,
    this.size,
    this.width,
    this.height,
    this.onTapImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    BorderRadius _borderRadius = (radiusTopL == null && radiusBottomR == null &&
        radiusBottomL == null && radiusBottomR == null) ? BorderRadius
        .circular(radius ?? 1) : BorderRadius.only(
      topLeft:Radius.circular( radiusTopL ?? 1),
      topRight: Radius.circular(radiusTopR ?? 1),
      bottomLeft: Radius.circular(radiusBottomL ?? 1),
      bottomRight: Radius.circular(radiusBottomR ?? 1),
    );

    return ClipRRect(
      borderRadius: _borderRadius,
      child: Stack(
        children: [

          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            width: width ?? size,
            height: height ?? size,
            placeholder: placeholderWidgetBuilder,
            errorWidget: errorWidgetBuilder,
            progressIndicatorBuilder: progressIndicatorBuilder,
          ),

          onTapImage == null ? const SizedBox() : Positioned(
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: _borderRadius,
                onTap: onTapImage == null
                    ? null
                    : () async {
                  await onTapImage!(imageUrl);
                },
                child: SizedBox(
                  width: width ?? size,
                  height: height ?? size,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
