import 'package:flutter/material.dart';
import 'package:uach_mobile/features/home/presentation/widgets/proximos%20eventos/proximos_eventos.dart';
import 'widgets/noticias_slideshow/noticias_slideshow.dart';
import 'widgets/Bienvenida_Old/homescreen_header_old.dart';
import 'widgets/Bienvenida_New/homescreen_header_new.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF0F6FD),
      body: SafeArea(
        child: Stack(
          children: [
            // Scrolling content
            SingleChildScrollView(
              padding: EdgeInsets.only(top: screenHeight * 1 / 8), // Espacio de padding para que el contenido comience después del header
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 15 / 812), // Separador
                  NoticiasSlideshow(), // Slideshow de noticias
                  SizedBox(height: screenHeight * 15 / 812), // Separador
                  ProximosEventos(),
                ],
              ),
            ),
            //Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HomeScreenHeaderNew()
              // child: HomeScreenHeaderOld()
            ),
          ],
        ),
      ),
    );
  }
}
