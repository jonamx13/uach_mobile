// noticias_card.dart

import 'package:flutter/material.dart';

class NoticiasCard extends StatelessWidget {
  const NoticiasCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  // Esto asegura que ocupe todo el ancho disponible
      height: 117,  // Establecemos el alto máximo en 117
      margin: const EdgeInsets.symmetric(vertical: 5), // Elimina el margen lateral, solo dejamos el vertical
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados en todo el contenedor
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2), // Sombra leve en la parte inferior
          ),
        ],
      ),
      child: ClipRRect( // Este ClipRRect asegurará que todo el contenido dentro tenga bordes redondeados
        borderRadius: BorderRadius.circular(10), // Bordes redondeados para toda la tarjeta
        child: Stack(
          fit: StackFit.expand, // Asegura que la imagen se expanda dentro del contenedor
          children: [
            // Imagen de fondo, se ajusta al ancho y ocupa toda el área del contenedor
            Image.asset(
              'assets/images/osuach-utep-8dic-1920.jpg',
              fit: BoxFit.cover,  // Escala la imagen para que ocupe todo el ancho
            ),
            // Contenedor para el texto, encima de la imagen
            Positioned(
              top: 15,  // Margin superior para separar el texto de los bordes
              left: 15,  // Margin izquierdo para separar el texto
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,  // El texto ocupa el 75% del ancho
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'La OSUACH con la UTEP',
                      style: TextStyle(
                        fontSize: 18,  // Ajusta el tamaño del título
                        fontWeight: FontWeight.bold,
                        color: Colors.white,  // Texto blanco
                      ),
                    ),
                    SizedBox(height: 5),  // Espaciado entre los textos
                    Text(
                      'Symphony Orchestra en Chihuahua',
                      style: TextStyle(
                        fontSize: 15,  // Tamaño del subtítulo
                        fontWeight: FontWeight.w400,
                        color: Colors.white,  // Texto blanco
                        height: 1.2,  // Line height
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
