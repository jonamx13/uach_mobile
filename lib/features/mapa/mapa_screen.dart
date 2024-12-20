import 'package:flutter/material.dart';


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
            // Botón de Facultad (ahora un TextButton)
            FacultadDropdown(),
            // Contenedor con el mapa interactivo
            Expanded(
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.zero,
                minScale: 1.0,
                maxScale: 7.0, // Ajusta según el nivel máximo de zoom deseado
                child: ClipRect( // Limita el movimiento a los bordes de la imagen
                  child: Image.asset(
                    'assets/images/placeholder_map.jpeg', // Ruta de tu imagen de mapa
                    fit: BoxFit.cover, // Asegura que la imagen cubra todo el alto del contenedor
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

class FacultadDropdown extends StatefulWidget {
  @override
  _FacultadDropdownState createState() => _FacultadDropdownState();
}

class _FacultadDropdownState extends State<FacultadDropdown> {
  String selectedFacultad = 'Facultad'; // Valor por defecto
  final List<String> facultades = [
    'Facultad de Ingeniería',
    'Facultad de Medicina',
    'Facultad de Derecho',
    'Facultad de Ciencias Sociales',
    'Facultad de Psicología'
  ];

  void _showDropdown(BuildContext context) async {
    // Ajustamos la posición para que el menú se muestre sobre todo el contenido, respetando el SafeArea
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);
    final double buttonHeight = button.size.height;

    final String? selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        0, // Lo posicionamos en el borde izquierdo de la pantalla
        buttonPosition.dy - buttonHeight,  // Esto posiciona el menú sobre el padding y la palabra "Mapa"
        buttonPosition.dx + button.size.width,
        buttonPosition.dy + 200, // Establecemos un tamaño fijo para el menú
      ),
      items: facultades.map((facultad) {
        return PopupMenuItem<String>(
          value: facultad,
          child: Text(facultad),
        );
      }).toList(),
    );

    if (selected != null) {
      setState(() {
        selectedFacultad = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextButton(
        onPressed: () => _showDropdown(context),
        child: Text(
          selectedFacultad,  // Muestra la facultad seleccionada o 'Facultad' si no se ha elegido ninguna
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0E1016), // Aseguramos que el color del texto sea adecuado
          ),
        ),
      ),
    );
  }
}
