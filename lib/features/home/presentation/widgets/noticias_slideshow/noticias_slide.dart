import 'package:flutter/material.dart';
import 'noticias_card.dart';
import 'texto_slideshow.dart';  // Importa el nuevo widget

class NoticiasSlide extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String subtitulo;
  final String tituloEvento;
  final String fecha;
  final String descripcion;

  const NoticiasSlide({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
    required this.tituloEvento,
    required this.fecha,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NoticiasCard(
            imagen: imagen,
            titulo: titulo,
            subtitulo: subtitulo,
          ),
          const SizedBox(height: 10),
          TextoSlideshow(  // Usa el nuevo widget aquí
            tituloEvento: tituloEvento,
            fecha: fecha,
            descripcion: descripcion,
          ),
        ],
      ),
    );
  }
}
