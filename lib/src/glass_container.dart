import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/src/hollo_shadow_painter.dart';

///[GlassContainer] Container with frosted glass effect
class GlassContainer extends StatelessWidget {
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

  ///[Widget] [child]
  final Widget? child;

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

  ///[GlassContainer] color
  ///
  ///default value: Colors.grey.shade100.withOpacity(opacity)
  final Color? color;

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
  /// [color] will be ignored if gradient is set.
  final Gradient? gradient;

  ///[GlassContainer] Container with frosted glass effect
  ///
  ///Note:
  ///
  ///It Inherit properties of [Container] so expect layout effect as container,
  ///while tinkering with height and width
  const GlassContainer({
    super.key,
    this.opacity = 0.05,
    this.child,
    this.blur = 5,
    this.border,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowStrength = 4,
    this.shadowColor = const Color(0x3D333333),
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Colors.grey.shade100.withOpacity(opacity);
    final _borderRadius = borderRadius ?? BorderRadius.circular(10);
    final _border = border ??
        Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 0.3,
        );
    return CustomPaint(
      painter: HollowShadowPainter(
        shadowStrength: shadowStrength,
        shadowColor: shadowColor,
      ),
      child: Container(
        width: width,
        height: height,
        foregroundDecoration: BoxDecoration(
          borderRadius: _borderRadius,
          border: _border,
        ),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _color,
                gradient: gradient,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
