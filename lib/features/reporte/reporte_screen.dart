import 'package:flutter/material.dart';

class ReporteScreen extends StatefulWidget {
  @override
  _ReporteScreenState createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  String? _selectedTipoIncidencia;

  // Controladores de los campos de texto
  final TextEditingController _detalleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título "Reportar incidencia"
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                child: Center( // Centrado del título
                  child: Text(
                    'Reportar incidencia',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 20 / 16, // Line height
                      color: Color(0xFF0E1016), // Color #0E1016
                    ),
                  ),
                ),
              ),
              // Imagen
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cgti_photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Título "Tipo de incidencia"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: Text(
                  'Tipo de incidencia',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF8B41BD), // Color #8B41BD
                  ),
                ),
              ),
              // Menú desplegable "Tipo de incidencia"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: DropdownButton<String>(
                  value: _selectedTipoIncidencia,
                  hint: Text(
                    'Selecciona el tipo de incidencia',
                    style: TextStyle(color: Color(0xFFB0B0B0)), // Gris para el texto por defecto
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTipoIncidencia = newValue;
                    });
                  },
                  isExpanded: true,
                  items: <String>['tipo 1', 'tipo 2', 'tipo 3', 'tipo 4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  dropdownColor: Color(0xFFD8E2FF), // Color de fondo del desplegable
                  style: TextStyle(color: Color(0xFF8B41BD)), // Color de los items
                ),
              ),
              // Título "Proporciona detalles"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: Text(
                  'Proporciona detalles',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF8B41BD), // Color #8B41BD
                  ),
                ),
              ),
              // Cuadro de texto para escribir
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD8E2FF), // Establecemos el color de fondo
                    borderRadius: BorderRadius.zero, // Sin bordes redondeados
                  ),
                  child: TextField(
                    controller: _detalleController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: 'Escribe aquí los detalles que puedan ayudarnos a manejar tu incidente',
                      hintStyle: TextStyle(color: Color(0xFFB0B0B0)), // Gris para el texto por defecto
                    ),
                  ),
                ),
              ),
              // Botón Enviar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // El botón no hace nada por ahora
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B41BD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    ),
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
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
