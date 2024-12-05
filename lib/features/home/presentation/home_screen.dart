import 'package:flutter/material.dart';
import 'widgets/noticias_slideshow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // Saludo
          Container(
            height: screenHeight * 100 / 812, // Proporción 100px
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
          SizedBox(height: screenHeight * 3 / 812), // Separador
          // Slideshow
           NoticiasSlideshow(),
          SizedBox(height: screenHeight * 3 / 812), // Separador
          // Próximos Eventos
          Expanded(
            child: Container(
              margin: EdgeInsets.all(screenHeight * 15 / 812),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
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
