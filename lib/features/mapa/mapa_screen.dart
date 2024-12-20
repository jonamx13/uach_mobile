import 'package:flutter/material.dart';
import 'widgets/facultad_dropdown.dart'; // Asegúrate de que la ruta sea correcta

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 52.0, bottom: 16.0),
              child: Center(
                child: Text(
                  'Mapa',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 20 / 16,
                    color: Color(0xFF0E1016),
                  ),
                ),
              ),
            ),
            FacultadDropdown(), // Botón de Facultad
            Expanded(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.zero,
                minScale: 1.0,
                maxScale: 7.0,
                child: ClipRect(
                  child: Image.asset(
                    'assets/images/placeholder_map.jpeg',
                    fit: BoxFit.cover,
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
