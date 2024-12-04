import 'package:flutter/material.dart';
import 'noticias_titulos.dart';

class NoticiasCard extends StatelessWidget {
  const NoticiasCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117, // Altura máxima ajustada
      decoration: BoxDecoration(
        color: Colors.grey[800], // Placeholder gris oscuro
        borderRadius: BorderRadius.circular(10),
      ),
      child: const NoticiasTitulos(), // Textos internos ajustados
    );
  }
}
