import 'package:flutter/material.dart';

class HomeScreenHeaderNew extends StatelessWidget {
  const HomeScreenHeaderNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeAreaHeight = mediaQuery.padding.top;

    //Main Container
    return Container(
      width: double.infinity,
      height: (mediaQuery.size.height - safeAreaHeight) / 7,
      child: Stack(
        children: [
          // Background
          Positioned(
            bottom: 0, // Alineado al borde inferior
            child: Container(
              width: mediaQuery.size.width, // Ancho igual al padre
              height: (mediaQuery.size.height - safeAreaHeight) / 45, // La mitad del alto del padre
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0), // Color azul
                    Colors.white, // Azul con opacidad 0
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // First Triangle
          Positioned.fill(
            child: CustomPaint(
              painter: CustomRectanglePainter(inverted: true),
            ),
          ),

          // Second Triangle
          Positioned.fill(
            child: CustomPaint(
              painter: CustomRectanglePainter(),
            ),
          ),

          // Contenido de la columna
          Column(
            children: [
              // Logo de la app centrado (PNG)
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo_uach_movil.png', // Ruta de la imagen PNG
                    width: 200, // Ancho del logo
                    height: 70, // Alto del logo
                    fit: BoxFit.contain, // Ajuste para mantener la escala del PNG
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRectanglePainter extends CustomPainter {
  final bool inverted;

  CustomRectanglePainter({this.inverted = false});

  @override
  void paint(Canvas canvas, Size size) {
    const Color darkColor = Color(0xFF2D0F42);
    const Color lightColor = Color(0xFF8B41BD);
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: inverted
            ? [lightColor, darkColor] // Colores invertidos
            : [darkColor, lightColor], // Colores normales
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Coordenadas
    final double vertex1X = 0;
    final double vertex1Y = 0;
    final double vertex2X = size.width;
    final double vertex2Y = 0;
    final double vertex3X = 0;
    final double vertex3Y = inverted ? size.height * 2 / 3 : size.height;
    final double vertex4X = size.width;
    final double vertex4Y = inverted ? size.height : size.height * 2 / 3;

    final path = Path()
      ..moveTo(vertex1X, vertex1Y)
      ..lineTo(vertex2X, vertex2Y)
      ..lineTo(vertex4X, vertex4Y)
      ..lineTo(vertex3X, vertex3Y)
      ..close(); // Cierra el Path

    canvas.drawPath(path, paint); // Dibuja el path con el gradiente
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No es necesario repintar, el rectángulo no cambia
  }
}
