import 'package:flutter/material.dart';

class HollowShadowPainter extends CustomPainter {
  HollowShadowPainter({
    required this.shadowColor,
    this.shadowStrength = 1,
  });

  final double shadowStrength;
  final Color shadowColor;
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  Paint customPainter({
    required double blurStrength,
    required Color color,
    required double strokeWidth,
  }) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(blurStrength),
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shadowStrength == 0) return;
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(-shadowStrength / 2, -shadowStrength / 2),
        Offset(
          size.width + shadowStrength / 2,
          size.height + shadowStrength / 2,
        ),
      ),
      const Radius.circular(10),
    );

    canvas.drawRRect(
      rrect,
      customPainter(
        color: shadowColor,
        blurStrength: 20,
        strokeWidth: shadowStrength,
      ),
    );
  }

  @override
  bool shouldRepaint(HollowShadowPainter oldDelegate) => oldDelegate != this;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HollowShadowPainter &&
        other.shadowStrength == shadowStrength &&
        other.shadowColor == shadowColor;
  }

  @override
  int get hashCode => shadowStrength.hashCode ^ shadowColor.hashCode;
}
