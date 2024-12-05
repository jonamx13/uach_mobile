import 'package:flutter/material.dart';
import 'noticias_card.dart';
import 'texto_slideshow.dart';

class NoticiasSlideshow extends StatelessWidget {
  const NoticiasSlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3), // Separación con la sección inferior
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), // Márgenes laterales
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NoticiasCard(), // Tarjeta con la imagen
            const SizedBox(height: 10), // Espaciado entre la tarjeta y el texto
            const TextoSlideshow(), // Widget de texto con márgenes controlados
            const SizedBox(height: 15), // Espaciado antes de los indicadores
            // Indicadores del slideshow
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.black : Colors.grey, // Activo/inactivo
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
