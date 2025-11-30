# Flutter Canvas Drawing Guide

## How Flutter Does Custom Drawing (Like Drawing on Canvas)

Flutter uses **CustomPaint** widget with **CustomPainter** class to draw custom graphics.

### Basic Structure

```dart
CustomPaint(
  painter: MyCustomPainter(), // Your custom painter
  child: Container(), // Optional child widget
)
```

### CustomPainter Class

```dart
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // This is where you draw!
    // You have access to:
    // - canvas: The drawing surface
    // - size: The size of the widget
    
    // Create a Paint object
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke // or fill
      ..strokeWidth = 2.0;
    
    // Draw shapes
    canvas.drawLine(Offset(0, 0), Offset(100, 100), paint);
    canvas.drawCircle(Offset(50, 50), 25, paint);
    canvas.drawRect(Rect.fromLTWH(10, 10, 100, 50), paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

### Common Drawing Methods

#### 1. Draw Lines
```dart
canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
```

#### 2. Draw Shapes
```dart
// Circle
canvas.drawCircle(center, radius, paint);

// Rectangle
canvas.drawRect(Rect.fromLTWH(x, y, width, height), paint);

// Rounded Rectangle
canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)), paint);

// Oval
canvas.drawOval(Rect.fromLTWH(x, y, width, height), paint);
```

#### 3. Draw Paths (Complex Shapes)
```dart
final path = Path();
path.moveTo(x1, y1);
path.lineTo(x2, y2);
path.quadraticBezierTo(controlX, controlY, endX, endY);
path.cubicTo(controlX1, controlY1, controlX2, controlY2, endX, endY);
path.close(); // Close the path

canvas.drawPath(path, paint);
```

#### 4. Draw Images
```dart
final image = await loadImage('assets/image.png');
canvas.drawImage(image, Offset(x, y), paint);
```

#### 5. Draw Text
```dart
final textPainter = TextPainter(
  text: TextSpan(text: 'Hello', style: TextStyle(color: Colors.black)),
  textDirection: TextDirection.ltr,
);
textPainter.layout();
textPainter.paint(canvas, Offset(x, y));
```

### Paint Properties

```dart
final paint = Paint()
  ..color = Colors.blue          // Color
  ..style = PaintingStyle.stroke  // stroke or fill
  ..strokeWidth = 2.0            // Line width
  ..strokeCap = StrokeCap.round  // Line end style
  ..strokeJoin = StrokeJoin.round // Line join style
  ..blendMode = BlendMode.srcOver // Blending mode
  ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5); // Blur effect
```

### Advanced Techniques

#### Gradients
```dart
final gradient = LinearGradient(
  colors: [Colors.red, Colors.blue],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final paint = Paint()
  ..shader = gradient.createShader(Rect.fromLTWH(0, 0, width, height));

canvas.drawRect(rect, paint);
```

#### Clipping
```dart
canvas.clipRect(Rect.fromLTWH(0, 0, 100, 100));
// Draw only within this rectangle
canvas.restore(); // Restore clipping
```

#### Transformations
```dart
canvas.save(); // Save current state
canvas.translate(50, 50); // Move origin
canvas.rotate(0.5); // Rotate
canvas.scale(1.5); // Scale
// Draw here
canvas.restore(); // Restore state
```

### Performance Tips

1. **shouldRepaint**: Return `false` if painting doesn't need to update
2. **Cache complex paths**: Don't recreate paths every frame
3. **Use RepaintBoundary**: Isolate expensive painters
4. **Avoid expensive operations**: Do calculations outside paint() if possible

### Example: Drawing Bamboo

```dart
class BambooPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    
    // Draw bamboo stalk
    canvas.drawLine(
      Offset(size.width * 0.1, size.height * 0.2),
      Offset(size.width * 0.1, size.height * 0.8),
      paint,
    );
    
    // Draw segments
    for (double y = size.height * 0.3; y < size.height * 0.8; y += 50) {
      canvas.drawLine(
        Offset(size.width * 0.1 - 5, y),
        Offset(size.width * 0.1 + 5, y),
        paint,
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

### Resources

- Flutter CustomPaint docs: https://api.flutter.dev/flutter/widgets/CustomPaint-class.html
- CustomPainter docs: https://api.flutter.dev/flutter/rendering/CustomPainter-class.html
- Canvas API: https://api.flutter.dev/flutter/dart-ui/Canvas-class.html

