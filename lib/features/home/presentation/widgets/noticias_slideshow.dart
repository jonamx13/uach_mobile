import 'package:flutter/material.dart';
import 'noticias_slide.dart';

class NoticiasSlideshow extends StatefulWidget {
  @override
  _NoticiasSlideshowState createState() => _NoticiasSlideshowState();
}

class _NoticiasSlideshowState extends State<NoticiasSlideshow> {
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0), // Recuperamos el padding
      child: Column(
        children: [
          // Slide actual
          NoticiasSlide(
            imagen: 'assets/images/osuach-utep-8dic-1920.jpg',
            titulo: 'La OSUACH con la UTEP',
            subtitulo: 'Symphony Orchestra en Chihuahua',
            tituloEvento: 'Música entre dos naciones hermanas',
            fecha: 'UACH / Noviembre 28, 2024',
            descripcion: 'La Orquesta Sinfónica de la Universidad Autónoma de Chihuahua (UACH), en colaboración con la Orquesta Sinfónica de la Universidad de Texas en El Paso (UTEP), se enorgullecen en anunciar un magno concierto de gala que reafirma el poder de la música como vehículo de unión entre dos naciones.',
          ),
          
          // Indicadores del slideshow
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: _currentIndex == index
                        ? Colors.black
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
