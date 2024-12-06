import 'package:flutter/material.dart';
import 'widgets/noticias_slideshow/noticias_slideshow.dart';
import 'widgets/Bienvenida/bienvenida_homescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea( // Añadido SafeArea para evitar recortes
        child: Column(
          children: [
            // Saludo
            BienvenidaHomeScreen(),

            SizedBox(height: screenHeight * 15 / 812), // Separador
            // Slideshow
            NoticiasSlideshow(),
            
            SizedBox(height: screenHeight * 15 / 812), // Separador
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
      ),
    );
  }
}
