///Create beautiful Glassmorphic ui using components provided by this package
library glassmorphism_ui;

import 'dart:ui';
import 'package:flutter/material.dart';

///[GlassContainer] Container with frosted glass effect
///
///Note:
///
///It Inherit properties of [Container] so expect layout effect as container,
///while tinkering with height and width
class GlassContainer extends StatelessWidget {
  ///```
  ///opacity is used to control the glass frosted effect
  ///
  ///value should be in between 0 and 1
  ///
  ///--1 means fully opaque
  ///--0 means fully transparent
  ///
  ///default value : 0.1
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
  ///borderRadius [BorderRadiusGeometry]
  ///
  ///example:
  ///BorderRadius.circular(10),
  ///
  /// default value : BorderRadius.circular(10),
  ///
  /// --to remove border use [BorderRadius.zero],
  ///```
  final BorderRadiusGeometry? borderRadius;

  ///[GlassContainer] Height
  final double? height;

  ///[GlassContainer] Width
  final double? width;

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

  const GlassContainer({
    Key? key,
    this.opacity = 0.05,
    this.child,
    this.blur = 5,
    this.border,
    this.height,
    this.width,
    this.borderRadius,
    this.shadowStrength = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaintShadow(shadowStrength: shadowStrength),
      child: Container(
        height: height,
        foregroundDecoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: border ??
              Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.3,
                  style: BorderStyle.solid),
        ),
        width: width,
        child: ClipRRect(
          borderRadius:
              borderRadius as BorderRadius? ?? BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                color: Colors.grey[100]!.withOpacity(opacity),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _PaintShadow extends CustomPainter {
  _PaintShadow({
    this.shadowStrength = 1,
  });

  final double shadowStrength;

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  Paint customPainter(
      {required double blurStrength,
      required Color color,
      double? opacity,
      required double strokeWidth}) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..color = color.withOpacity(0.24)
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(
          blurStrength,
        ),
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shadowStrength == 0) return;
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(-shadowStrength / 2, -shadowStrength / 2),
          Offset(
            size.width + shadowStrength / 2,
            size.height + shadowStrength / 2,
          ),
        ),
        Radius.circular(10));
    canvas.drawRRect(
      rect,
      customPainter(
        color: Color(0xff333333),
        blurStrength: 20,
        strokeWidth: shadowStrength,
        opacity: 0.24,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
