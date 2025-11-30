import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class AuroraBackground extends StatelessWidget {
  const AuroraBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: AuroraPainter(),
      ),
    );
  }
}

class AuroraPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Base dark night sky
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF030510),
          const Color(0xFF0A0A15),
          const Color(0xFF151520),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), basePaint);
    
    // Natural starfield
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    final random = math.Random(123);
    for (int i = 0; i < 250; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final starSize = random.nextDouble() * 1.8 + 0.2;
      final brightness = random.nextDouble();
      
      canvas.drawCircle(
        Offset(x, y),
        starSize,
        starPaint..color = Colors.white.withOpacity(brightness * 0.8),
      );
    }
    
    final centerY = size.height * 0.4;
    
    // Realistic aurora - organic cloud-like shapes
    _drawAuroraCloud(
      canvas,
      size,
      centerY - 80,
      [
        Colors.transparent,
        Colors.green.shade700.withOpacity(0.15),
        Colors.teal.shade500.withOpacity(0.35),
        Colors.cyan.shade400.withOpacity(0.5),
        Colors.teal.shade500.withOpacity(0.35),
        Colors.green.shade700.withOpacity(0.15),
        Colors.transparent,
      ],
      200,
      0.0,
    );
    
    _drawAuroraCloud(
      canvas,
      size,
      centerY - 40,
      [
        Colors.transparent,
        Colors.blue.shade600.withOpacity(0.12),
        Colors.purple.shade500.withOpacity(0.3),
        Colors.blue.shade400.withOpacity(0.45),
        Colors.purple.shade500.withOpacity(0.3),
        Colors.blue.shade600.withOpacity(0.12),
        Colors.transparent,
      ],
      180,
      0.4,
    );
    
    _drawAuroraCloud(
      canvas,
      size,
      centerY,
      [
        Colors.transparent,
        Colors.purple.shade500.withOpacity(0.15),
        Colors.pink.shade400.withOpacity(0.3),
        Colors.cyan.shade300.withOpacity(0.4),
        Colors.pink.shade400.withOpacity(0.3),
        Colors.purple.shade500.withOpacity(0.15),
        Colors.transparent,
      ],
      160,
      0.7,
    );
    
    // Subtle bottom glow
    _drawAuroraCloud(
      canvas,
      size,
      centerY + 40,
      [
        Colors.transparent,
        Colors.green.shade600.withOpacity(0.1),
        Colors.teal.shade400.withOpacity(0.25),
        Colors.green.shade500.withOpacity(0.3),
        Colors.teal.shade400.withOpacity(0.25),
        Colors.green.shade600.withOpacity(0.1),
        Colors.transparent,
      ],
      140,
      0.2,
    );
  }
  
  void _drawAuroraCloud(
    Canvas canvas,
    Size size,
    double centerY,
    List<Color> colors,
    double maxHeight,
    double phase,
  ) {
    // Create organic, cloud-like aurora shape
    final path = Path();
    final segments = 100;
    final waveWidth = size.width;
    
    // Start from left
    path.moveTo(0, centerY);
    
    // Create organic flowing wave with multiple frequencies
    for (int i = 0; i <= segments; i++) {
      final t = i / segments;
      final x = t * waveWidth;
      
      // Multiple overlapping waves for natural flow
      final wave1 = math.sin(t * math.pi * 2.5 + phase) * maxHeight * 0.35;
      final wave2 = math.sin(t * math.pi * 4.3 + phase * 1.5) * maxHeight * 0.25;
      final wave3 = math.sin(t * math.pi * 6.1 + phase * 2.3) * maxHeight * 0.15;
      final wave4 = math.sin(t * math.pi * 8.7 + phase * 3.1) * maxHeight * 0.1;
      
      // Add some randomness for organic feel
      final noise = math.sin(t * math.pi * 12 + phase * 4) * maxHeight * 0.05;
      
      final y = centerY + wave1 + wave2 + wave3 + wave4 + noise;
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Smooth curves
        final prevT = (i - 1) / segments;
        final prevX = prevT * waveWidth;
        final prevWave1 = math.sin(prevT * math.pi * 2.5 + phase) * maxHeight * 0.35;
        final prevWave2 = math.sin(prevT * math.pi * 4.3 + phase * 1.5) * maxHeight * 0.25;
        final prevWave3 = math.sin(prevT * math.pi * 6.1 + phase * 2.3) * maxHeight * 0.15;
        final prevWave4 = math.sin(prevT * math.pi * 8.7 + phase * 3.1) * maxHeight * 0.1;
        final prevNoise = math.sin(prevT * math.pi * 12 + phase * 4) * maxHeight * 0.05;
        final prevY = centerY + prevWave1 + prevWave2 + prevWave3 + prevWave4 + prevNoise;
        
        // Smooth bezier curve
        final controlX = (prevX + x) / 2;
        final controlY = (prevY + y) / 2;
        path.quadraticBezierTo(controlX, controlY, x, y);
      }
    }
    
    // Close path to bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    // Draw with soft gradient
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        stops: List.generate(colors.length, (i) => i / (colors.length - 1)),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawPath(path, paint);
    
    // Add soft glow with blur
    final glowPath = Path();
    glowPath.addPath(path, Offset.zero);
    final glowPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: size.width * 0.6,
        colors: [
          colors[colors.length ~/ 2].withOpacity(0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30.0);
    
    canvas.drawPath(glowPath, glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
