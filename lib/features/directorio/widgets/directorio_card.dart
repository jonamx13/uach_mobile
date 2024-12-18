import 'package:flutter/material.dart';
import 'package:uach_mobile/features/directorio/data/directorio_data.dart';

class DirectorioCard extends StatelessWidget {
  final String titulo;
  final List<Map<String, String>> contactos;

  const DirectorioCard({
    Key? key,
    required this.titulo,
    required this.contactos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            titulo,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              height: 16.25 / 13, // Line height
              color: Color(0xFF0E1016),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contactos.map((contacto) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  // Puedes agregar aquí la acción para cada link
                },
                child: Text(
                  contacto['nombre'] ?? '',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 16.8 / 12, // Line height
                    color: Color(0xFF3989CB),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DirectorioCard(
                          titulo: 'Direcciones, Coordinaciones y Departamentos',
                          contactos: directorioData,
                        ),
                        SizedBox(height: 8),  // Separación entre DetallesIncidencia y EnviarReporte
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
