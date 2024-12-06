import 'package:flutter/material.dart';
import '../data/noticias_data.dart'; // Importamos los datos
import 'noticias_slide.dart';

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
          // Sección deslizable con diseño original
          SizedBox(
            height: 400, // Ajusta la altura según necesites
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: noticias.length, // Número dinámico de slides
              itemBuilder: (context, index) {
                final noticia = noticias[index]; // Extraemos cada noticia
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
          // Indicadores dinámicos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              noticias.length, // Indicadores según el número de noticias
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor:
                        _currentIndex == index ? Colors.black : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
