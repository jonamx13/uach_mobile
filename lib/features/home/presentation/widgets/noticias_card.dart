import 'package:flutter/material.dart';
import 'noticias_titulos.dart';

class NoticiasCard extends StatelessWidget {
  const NoticiasCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800], // Placeholder para la imagen
        borderRadius: BorderRadius.circular(10),
      ),
      child: const NoticiasText(), // Aquí usamos el widget de texto
    );
  }
}
