import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/src/blur.dart';
import 'package:glassmorphism_ui/src/glass_container.dart';

/// [GlassImage]
///
/// Image with frosted glass overlay
class GlassImage extends StatelessWidget {
  ///```
  /// opacity is used to control the glass frosted effect
  ///
  /// Value should be in between 0 and 1
  ///
  /// No effect if color is set
  ///
  /// default value : 0.1
  ///```
  final double opacity;

  ///```
  ///blur intensity
  ///default value : 5
  ///```
  final double blur;

  ///```
  /// shadow strength
  ///
  /// default value : 4
  /// ```
  final double shadowStrength;

  ///```
  /// shadow color
  ///
  /// default value : 4
  /// ```
  final Color shadowColor;

  ///```
  ///borderRadius [BorderRadiusGeometry]
  ///
  ///example:
  ///BorderRadius.circular(10),
  ///
  /// default value : BorderRadius.circular(10),
  ///
  ///```
  final BorderRadius? borderRadius;

  ///[GlassContainer] Height
  final double? height;

  ///[GlassContainer] Width
  final double? width;

  ///[overlayColor]
  ///
  ///default value: Colors.grey.shade100.withOpacity(opacity)
  final Color? overlayColor;

  ///```
  ///border [BoxBorder]
  ///
  ///example:
  ///Border.all(
  ///   color: Colors.white.withOpacity(0.3),
  ///   width: 0.3,
  ///   style: BorderStyle.solid,
  ///),
  ///
  ///default is same as example
  ///```
  final BoxBorder? border;

  /// [Gradient] gradient
  ///
  /// [overlayColor] will be ignored if gradient is set.
  final Gradient? gradient;

  ///[Image]
  final Image image;

  /// [GlassImage]
  ///
  /// Image with frosted glass overlay
  const GlassImage({
    super.key,
    this.opacity = 0.05,
    this.blur = 5,
    this.border,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowStrength = 2,
    this.shadowColor = const Color(0x3D333333),
    this.overlayColor,
    this.gradient,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final _borderRadius = borderRadius ?? BorderRadius.circular(10);

    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: _borderRadius,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: image,
            ),
          ),
        ),
        GlassContainer(
          blur: 0,
          width: width,
          border: border,
          borderRadius: _borderRadius,
          color: overlayColor,
          gradient: gradient,
          opacity: opacity,
          shadowColor: shadowColor,
          shadowStrength: shadowStrength,
          height: height,
        ),
      ],
    );
  }
}

/// Blur Image
///
/// To blur any widget use [Blur] widget
///
/// Wrap it with [ClipRect] widget if it blur outside the widget or use [ImageExtension]'s blurClipped extension method
///
/// ```dart
/// ClipRect(
///  child: BlurredImage(
///   image: Image.network(
///      "link",
///      fit: BoxFit.cover,
///    ),
///   ),
/// ),
/// ```
class BlurredImage extends Blur {
  /// Blur Image
  const BlurredImage({super.key, super.blur = 4, required Image image})
      : super(child: image);
}

///[ImageExtension]
extension ImageExtension on Image {
  /// Create [BlurredImage]
  Widget blur({double blur = 3}) {
    return BlurredImage(image: this, blur: blur);
  }

  /// Create [BlurredImage] with [ClipRect] parent
  Widget blurClipped({double blur = 3}) {
    return ClipRect(child: BlurredImage(image: this, blur: blur));
  }
}
