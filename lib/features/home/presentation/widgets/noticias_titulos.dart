import 'package:flutter/material.dart';

class NoticiasTitulos extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const NoticiasTitulos({
    Key? key,
    required this.titulo,
    required this.subtitulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15), // Márgenes internos
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontFamily: 'Dela Gothic One',
              fontSize: 15,
              height: 1.2, // Line height proporcional
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitulo,
            style: const TextStyle(
              fontFamily: 'Dela Gothic One',
              fontSize: 15,
              height: 1.2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
