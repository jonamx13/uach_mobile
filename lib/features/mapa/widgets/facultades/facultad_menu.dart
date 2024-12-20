import 'package:flutter/material.dart';

class FacultadMenu extends StatelessWidget {
  final Function(String) onFacultadSelected;

  FacultadMenu({required this.onFacultadSelected});

  final List<String> facultades = [
    'Facultad de Ingeniería',
    'Facultad de Medicina',
    'Facultad de Derecho',
    'Facultad de Ciencias Sociales',
    'Facultad de Psicología'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: facultades.map((facultad) {
        return GestureDetector(
          onTap: () {
            onFacultadSelected(facultad);  // Llama al callback con la facultad seleccionada
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Text(
              facultad,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0E1016),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
