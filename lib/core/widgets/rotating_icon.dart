import 'package:flutter/material.dart';
import 'dart:math';

class RotatingIcon extends StatelessWidget {
  final double rotation; // Recibimos el parámetro isSelected

  const RotatingIcon({
    Key? key,
    required this.rotation, // Necesitamos el parámetro isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculamos el valor de rotación basado en isSelected
    double rotationAngle = rotation; // 90 grados si está seleccionado

    return CustomPaint(
      size: const Size(50, 50),
      painter: CrossInCirclePainter(rotationAngle), // Pasamos el ángulo de rotación calculado
    );
  }
}

class CrossInCirclePainter extends CustomPainter {
  final double verticalLineRotation; // Guardamos el valor de rotación

  CrossInCirclePainter(this.verticalLineRotation);

  @override
  void paint(Canvas canvas, Size size) {
    // Crea un pincel para el círculo de color #9C6BD0
    Paint paint = Paint()
      ..color = const Color(0xFF9C6BD0) // Color #9C6BD0
      ..style = PaintingStyle.fill;

    // Dibuja el círculo exterior
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Crea el pincel para las líneas de la cruz (color blanco y bordes redondeados)
    paint.color = Colors.white;
    paint.strokeWidth = 4;
    paint.strokeCap = StrokeCap.round; // Bordes redondeados

    // Dibuja el círculo interior (sin relleno, solo el borde)
    Paint circleBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4; // Mismo grosor que las líneas de la cruz
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 * 0.75, circleBorderPaint);

    // Dibuja las líneas horizontales (siempre tienen la misma longitud)
    double horizontalLineLength = size.width * 0.4;
    canvas.drawLine(
      Offset(size.width / 2 - horizontalLineLength / 2, size.height / 2), // Inicio de la línea
      Offset(size.width / 2 + horizontalLineLength / 2, size.height / 2), // Fin de la línea
      paint,
    );

    // Dibuja las líneas verticales con rotación
    canvas.save(); // Guardamos el estado actual
    canvas.translate(size.width / 2, size.height / 2); // Mover al centro
    canvas.rotate(verticalLineRotation); // Aplicamos la rotación
    double verticalLineLength = size.height * 0.4;
    canvas.drawLine(
      Offset(0, -verticalLineLength / 2), // Línea superior
      Offset(0, verticalLineLength / 2),  // Línea inferior
      paint,
    );
    canvas.restore(); // Restauramos el estado para no afectar el resto del dibujo
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
