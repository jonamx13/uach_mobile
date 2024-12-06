import 'package:flutter/material.dart';
import '../../data/noticias_data.dart';
import 'noticias_slide.dart';
import 'noticias_indicadores.dart'; // Importamos el nuevo widget

class NoticiasSlideshow extends StatefulWidget {
  @override
  _NoticiasSlideshowState createState() => _NoticiasSlideshowState();
}

class _NoticiasSlideshowState extends State<NoticiasSlideshow> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          // Sección deslizable
          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: NoticiasSlide(
                    imagen: noticia['imagen']!,
                    titulo: noticia['titulo']!,
                    subtitulo: noticia['subtitulo']!,
                    tituloEvento: noticia['tituloEvento']!,
                    fecha: noticia['fecha']!,
                    descripcion: noticia['descripcion']!,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Indicadores dinámicos usando el nuevo widget
          NoticiasIndicadores(
            totalIndicadores: noticias.length,
            indicadorActivo: _currentIndex,
          ),
        ],
      ),
    );
  }
}
