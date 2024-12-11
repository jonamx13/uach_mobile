import 'package:flutter/material.dart';

class NoticiasIndicadores extends StatelessWidget {
  final int totalIndicadores;
  final int indicadorActivo;

  const NoticiasIndicadores({
    Key? key,
    required this.totalIndicadores,
    required this.indicadorActivo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding del slideshow
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuir espacio entre los indicadores
        children: List.generate(
          totalIndicadores,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0), // Separación de 10px entre bullets
              child: Center(
                child: Container(
                  height: 6, // Altura pequeña para que se vea como una línea
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // Bordes redondeados
                    color: indicadorActivo == index 
                        ? Color(0xFF8D7DA3)  // Color activo: #8d7da3
                        : Color(0xFFE4E4E4), // Color inactivo: #e4e4e4
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
