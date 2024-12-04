import 'package:flutter/material.dart';
import 'widgets/noticias_slideshow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Saludo
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: const Text(
                '¡Hola, Usuario!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 3), // Separador
          // Slideshow
          const Expanded(
            flex: 2,
            child: NoticiasSlideshow(),
          ),
          const SizedBox(height: 3), // Separador
          // Próximos Eventos
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Próximos Eventos (Placeholder)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
