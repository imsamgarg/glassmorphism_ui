import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class GlassIcon extends GlassContainer {
  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 200,
      width: 200,
      opacity: 1,
      borderRadius: BorderRadius.circular(100),
      color: Colors.white.withOpacity(0.2),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Colors.blue,
        ],
      ),
      border: const Border.fromBorderSide(BorderSide.none),
      shadowStrength: 60,
      shadowColor: Colors.white.withOpacity(0.24),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcOut),
        child: Stack(
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                backgroundBlendMode: BlendMode.dstOut,
              ),
            ),
            const Center(
              child: Icon(
                Icons.chair,
                size: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
