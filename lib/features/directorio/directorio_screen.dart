import 'package:flutter/material.dart';
import './widgets/directorio_card.dart';
import './data/directorio_data.dart';

class DirectorioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // LandImage (No será scrolleable)
            Padding(
              padding: const EdgeInsets.only(top: 52.0, bottom: 16.0),
              child: Center(
                child: Text(
                  'Directorio',
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
            // Land photo (No será scrolleable)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rectoria_photo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Aquí mapeamos los datos y pasamos cada grupo al DirectorioCard
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: directorioData.map((directorioGrupo) {
                      return Column(
                        children: [
                          DirectorioCard(
                            titulo: directorioGrupo['directorio'],
                            contactos: List<Map<String, String>>.from(
                                directorioGrupo['lista_contactos']),
                          ),
                          SizedBox(height: 20), // Añadimos un espaciado entre los grupos
                        ],
                      );
                    }).toList(),
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
