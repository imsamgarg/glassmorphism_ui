import 'package:flutter/material.dart';

///Render Shadow around the container
class HollowShadowPainter extends CustomPainter {
  HollowShadowPainter({
    required this.shape,
    required this.borderRadius,
    required this.shadowColor,
    this.shadowStrength = 1,
  });

  final double shadowStrength;
  final Color shadowColor;
  final BoxShape shape;
  final BorderRadius borderRadius;

  static double _convertRadiusToSigma(double radius) {
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
        _convertRadiusToSigma(blurStrength),
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shadowStrength == 0) return;

    if (shape == BoxShape.circle) {
      return canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 + shadowStrength / 2,
        customPainter(
          color: shadowColor,
          blurStrength: 20,
          strokeWidth: shadowStrength,
        ),
      );
    }

    final RRect rrect = RRect.fromRectAndCorners(
      Rect.fromPoints(
        Offset(-shadowStrength / 2, -shadowStrength / 2),
        Offset(
          size.width + shadowStrength / 2,
          size.height + shadowStrength / 2,
        ),
      ),
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
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
        other.shadowColor == shadowColor &&
        other.shape == shape &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode {
    return shadowStrength.hashCode ^
        shadowColor.hashCode ^
        shape.hashCode ^
        borderRadius.hashCode;
  }
}
