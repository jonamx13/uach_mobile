import 'package:flutter/material.dart';

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
              fontWeight: FontWeight.w800,
              fontSize: 15,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                          contacto['nombre_contacto'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 16.8 / 12, // Line height
                            color: Color(0xFF3989CB),
                          ),
                        ),
                        Divider(
                        color: Color(0xFFD8E2FF),
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(height: 8,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                        'Teléfono: ${contacto['telefono_contacto']}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF0E1016),
                        ),
                      ),
                      Text(
                        'Correo: ${contacto['correo_electronico']}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF0E1016),
                        ),
                      ),
                      Text(
                        'Dirección: ${contacto['direccion']}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF0E1016),
                        ),
                      ),
                      SizedBox(height: 8)
                        ]
                      ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
