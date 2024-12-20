import 'package:flutter/material.dart';

class FacultadDropdownMenu extends StatelessWidget {
  final List<String> facultades;
  final Function(String) onSelect;

  const FacultadDropdownMenu({
    Key? key,
    required this.facultades,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:  Color(0xFFE5ECFF),
      child: Column(
        children: [
          // Encabezado con ícono de cerrar y texto centrado
          Container(
            height: 72, // Altura fija de 72px
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            color: Color(0xFFFFFFFF), // Fondo de color #E5ECFF
            child: Row(
              children: [
                // Ícono de cerrar a la izquierda
                Icon(
                  Icons.close,
                  color: Color(0xFF8B41BD), // Color del ícono (opcional)
                ),
                // Texto centrado con el estilo que especificaste
                Expanded(
                  child: Center(
                    child: Text(
                      'Selecciona tu Facultad',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF8B41BD), // Color #8B41BD
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Lista de opciones del dropdown
          ListView(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            children: facultades.map((facultad) {
              return ListTile(
                title: Text(facultad),
                onTap: () {
                  onSelect(facultad);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}