import 'package:flutter/material.dart';
import 'bienvenida_alumno.dart';

class BienvenidaHomeScreen extends StatelessWidget {
  const BienvenidaHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 263,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF401E57), // Segundo color del gradiente
            Color(0xFF8B41BD), // Primer color del gradiente
          ],
        ),
      ),
      child: Column(
        children: [
          // El primer recuadro (logo de la app)
          Container(
            width: 189,
            height: 44,
            margin: EdgeInsets.only(top: 15, bottom: 30),
            alignment: Alignment.center,
            color: Colors.grey,
            child: Text(
              'logo de la app',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // El recuadro con la bienvenida al alumno
          BienvenidaAlumno(),
        ],
      ),
    );
  }
}
