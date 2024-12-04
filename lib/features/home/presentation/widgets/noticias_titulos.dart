import 'package:flutter/material.dart';

class NoticiasTitulos extends StatelessWidget {
  const NoticiasTitulos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      right: 15,
      child: SizedBox(
        width: 375 * 0.75, // 75% del ancho
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Título
            Text(
              'La OSUACH con la UTEP',
              style: TextStyle(
                fontFamily: 'Dela Gothic One',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8), // Espaciado entre textos
            // Subtítulo
            Text(
              'Symphony Orchestra en Chihuahua',
              style: TextStyle(
                fontFamily: 'Dela Gothic One',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
