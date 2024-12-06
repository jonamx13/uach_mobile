import 'package:flutter/material.dart';

class NoticiasCard extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String subtitulo;

  const NoticiasCard({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117, // Altura máxima
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Imagen
            Image.asset(
              imagen,
              width: double.infinity,
              height: 117, // Aseguramos que la imagen tenga la misma altura máxima
              fit: BoxFit.cover,
            ),
            // Textos sobre la imagen
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
