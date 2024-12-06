import 'package:flutter/material.dart';

class TextoSlideshow extends StatelessWidget {
  final String tituloEvento;
  final String fecha;
  final String descripcion;

  const TextoSlideshow({
    Key? key,
    required this.tituloEvento,
    required this.fecha,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0), // Márgenes laterales
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del evento
          Text(
            tituloEvento,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          // Fecha
          Text(
            fecha,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          // Descripción
          Text(
            descripcion,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
