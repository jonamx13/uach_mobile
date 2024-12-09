import 'package:flutter/material.dart';
import 'avatar_usuario.dart';

class BienvenidaAlumno extends StatelessWidget {
  const BienvenidaAlumno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346, // Ancho fijo para el recuadro
      height: 86, // Altura del recuadro
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EDF8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,  // Permite que el avatar sobresalga
        children: [
          // Contenido del recuadro (texto)
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '¡Hola César Ortiz!',
                  style: TextStyle(
                    fontFamily: 'Dela Gothic One',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF0E1016),
                    height: 1.25,
                  ),
                ),
                Text(
                  'Facultad de Ingeniería',
                  style: TextStyle(
                    fontFamily: 'Dela Gothic One',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xFF0E1016),
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          // Avatar en la esquina inferior derecha
          Positioned(
            bottom: -25, // Ajustamos para que sobresalga un tercio del avatar
            right: 0,
            child: const AvatarUsuario(),
          ),
        ],
      ),
    );
  }
}
