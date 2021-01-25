library glassmorphism_ui;

import 'dart:ui';
import 'package:flutter/material.dart';

///[GlassContainer] Container with frosted glass effect \n
///
/// Note:\n
///It Inherit properties of [Container] so expect layout effect as container,\n
///while tinkering with height and width
class GlassContainer extends StatelessWidget {
  ///[opacity] is used to control the glass frosted effect\n
  ///[opacity] should be between 0 and 1\n
  ///1 means full opaque\n
  ///0 means full transparent\n
  ///default value is 0.1\n
  final double opacity;

  ///[Widget] [child]
  final Widget child;

  ///blur intensity\n
  ///default value is 5
  final double blur;

  /// shadow strength\n
  /// default value is 4\n
  /// to remove shadow provide value 0\n
  /// shadowStrength : 0\n
  final double shadowStrength;

  ///Border Radius\n
  ///example:\n
  ///borderRadius: BorderRadius.circular(10),\n
  ///default value is same as example\n
  ///to remove border use [BorderRadius.zero],\n
  final BorderRadiusGeometry borderRadius;

  ///[GlassContainer] Height in [double]\n
  ///no default height
  final double height;

  ///[GlassContainer] Width in [double]\n
  ///no default width
  final double width;

  ///[border] example\n
  ///Border.all(\n
  ///   color: Colors.white.withOpacity(0.3),\n
  ///   width: 0.3,\n
  ///   style: BorderStyle.solid,\n
  ///),
  ///default is same as above example\n
  final BoxBorder border;

  const GlassContainer(
      {Key key,
      this.opacity = 0.05,
      this.child,
      this.blur = 5,
      this.border,
      this.height,
      this.width,
      this.borderRadius,
      this.shadowStrength = 4})
      : super(key: key);

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
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur,
              sigmaY: blur,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                color: Colors.grey[100].withOpacity(opacity),
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
      {double blurStrength, Color color, double opacity, double strokeWidth}) {
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
