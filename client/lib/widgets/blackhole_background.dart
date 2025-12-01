import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class BlackholeBackground extends StatelessWidget {
  const BlackholeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: BlackholePainter(),
      ),
    );
  }
}

class BlackholePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    
    // Base dark space background
    final spacePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: size.width * 0.8,
        colors: [
          const Color(0xFF1A1A2E),
          const Color(0xFF0F0F1E),
          Colors.black,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), spacePaint);
    
    // Draw stars
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    final random = math.Random(42); // Fixed seed for consistent stars
    for (int i = 0; i < 150; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final distance = (Offset(x, y) - center).distance;
      
      // Fade stars near center (blackhole effect)
      final opacity = math.min(1.0, distance / (size.width * 0.3));
      if (opacity > 0.1) {
        final starSize = random.nextDouble() * 1.5 + 0.5;
        canvas.drawCircle(
          Offset(x, y),
          starSize,
          starPaint..color = Colors.white.withOpacity(opacity * 0.8),
        );
      }
    }
    
    // Blackhole effect - multiple radial gradients for light bending
    final blackholeRadius = size.width * 0.55;
    
    // Outer light ring (accretion disk)
    final outerRing = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: blackholeRadius * 1.8,
        colors: [
          Colors.transparent,
          Colors.blue.shade900.withOpacity(0.3),
          Colors.purple.shade900.withOpacity(0.5),
          Colors.transparent,
        ],
        stops: const [0.0, 0.4, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(center, blackholeRadius * 1.8, outerRing);
    
    // Middle light ring
    final middleRing = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: blackholeRadius * 1.3,
        colors: [
          Colors.transparent,
          Colors.blue.shade700.withOpacity(0.4),
          Colors.purple.shade700.withOpacity(0.6),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(center, blackholeRadius * 1.3, middleRing);
    
    // Inner bright ring (event horizon glow)
    final innerRing = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: blackholeRadius * 0.9,
        colors: [
          Colors.transparent,
          Colors.cyan.shade400.withOpacity(0.3),
          Colors.blue.shade400.withOpacity(0.5),
          Colors.transparent,
        ],
        stops: const [0.0, 0.6, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(center, blackholeRadius * 0.9, innerRing);
    
    // Central blackhole (dark center)
    final blackholePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: blackholeRadius * 0.6,
        colors: [
          Colors.black,
          const Color(0xFF0A0A0A),
          Colors.transparent,
        ],
        stops: const [0.0, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawCircle(center, blackholeRadius * 0.6, blackholePaint);
    
    // Light rays bending around blackhole
    final rayPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    
    for (int i = 0; i < 12; i++) {
      final angle = (i * math.pi * 2 / 12);
      final startRadius = blackholeRadius * 1.5;
      final endRadius = blackholeRadius * 2.5;
      
      final startX = center.dx + math.cos(angle) * startRadius;
      final startY = center.dy + math.sin(angle) * startRadius;
      final endX = center.dx + math.cos(angle) * endRadius;
      final endY = center.dy + math.sin(angle) * endRadius;
      
      // Curved path (light bending)
      final path = Path();
      path.moveTo(startX, startY);
      path.quadraticBezierTo(
        center.dx + math.cos(angle) * (startRadius + endRadius) / 2,
        center.dy + math.sin(angle) * (startRadius + endRadius) / 2 - 20,
        endX,
        endY,
      );
      
      canvas.drawPath(path, rayPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

