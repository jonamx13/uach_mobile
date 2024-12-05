import 'package:flutter/material.dart';

class TextoSlideshow extends StatelessWidget {
  const TextoSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0), // Márgenes laterales
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del evento
          const Text(
            "Música entre dos naciones hermanas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          // Fecha del evento
          const Text(
            "UACH / Noviembre 28, 2024",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          // Descripción del evento
          const Text(
            "La Orquesta Sinfónica de la Universidad Autónoma de Chihuahua (UACH), en colaboración con la Orquesta Sinfónica de la Universidad de Texas en El Paso (UTEP), se enorgullecen en anunciar un magno concierto de gala que reafirma el poder de la música como vehículo de unión entre dos naciones.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4, // Altura de línea
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 15), // Espaciado antes de los indicadores
        ],
      ),
    );
  }
}
