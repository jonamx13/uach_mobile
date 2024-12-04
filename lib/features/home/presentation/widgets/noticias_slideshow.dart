import 'package:flutter/material.dart';
import 'noticias_card.dart';

class NoticiasSlideshow extends StatelessWidget {
  const NoticiasSlideshow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 305,
      margin: const EdgeInsets.all(15).copyWith(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const NoticiasCard(), // Aquí usamos el widget de la tarjeta
    );
  }
}
