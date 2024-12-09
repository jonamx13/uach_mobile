import 'package:flutter/material.dart';
import 'widgets/noticias_slideshow/noticias_slideshow.dart';
import 'widgets/Bienvenida_Old/bienvenida_homescreen_old.dart';
import 'widgets/Bienvenida_New/bienvenida_homescreen_new.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea( // Añadido SafeArea para evitar recortes
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Saludo
              BienvenidaHomeScreenNew(), // Header fijo
              SizedBox(height: screenHeight * 15 / 812), // Separador

              // Slideshow
              NoticiasSlideshow(),

              SizedBox(height: screenHeight * 15 / 812), // Separador

              // Crear varias instancias de "Próximos Eventos"
              for (int i = 0; i < 15; i++) 
                Container(
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
                      'Próximos Eventos (Placeholder) ${i + 1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
