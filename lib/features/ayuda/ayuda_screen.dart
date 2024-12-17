import 'package:flutter/material.dart';

class AyudaScreen extends StatefulWidget {
  @override
  _AyudaScreenState createState() => _AyudaScreenState();
}

class _AyudaScreenState extends State<AyudaScreen> with TickerProviderStateMixin {
  String? _selectedTipoIncidencia;
  final TextEditingController _detalleController = TextEditingController();
  bool _isDropdownOpen = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Controlador de animación
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // Animación de deslizamiento hacia abajo
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.3), // Empieza ligeramente arriba del contenedor
      end: Offset(0, 0), // Se mueve a la posición final
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 64; // Ancho del contenedor

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
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0), // Eliminar padding vertical
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDropdownOpen = !_isDropdownOpen;
                      if (_isDropdownOpen) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isDropdownOpen ? Color(0xFF767E94) : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    width: containerWidth, // Usamos el ancho fijo
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedTipoIncidencia ??
                              'Selecciona el tipo de incidencia',
                          style: TextStyle(
                            color: _isDropdownOpen ? Colors.white : Color(0xFF8B41BD),
                          ),
                        ),
                        Icon(
                          _isDropdownOpen
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: _isDropdownOpen ? Colors.white : Color(0xFF8B41BD),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Usamos un Stack para que el Dropdown se superponga sobre el TextField
              Stack(
                children: [
                  // Dropdown animado
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return SlideTransition(
                        position: _slideAnimation,
                        child: _isDropdownOpen
                            ? Container(
                                width: containerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: <String>[
                                    'Problema con las plataformas virtuales',
                                    'Emergencia médica',
                                    'Peligro de inseguridad',
                                    'Asistencia mecánica',
                                    'Violencia de género'
                                  ].map((String item) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedTipoIncidencia = item;
                                          _isDropdownOpen = false; // Cerrar el dropdown al seleccionar
                                          _animationController.reverse();
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                        color: _selectedTipoIncidencia == item
                                            ? Color(0xFF767E94)
                                            : Colors.white,
                                        child: Align(
                                          alignment: Alignment.centerLeft, // Alinea el texto hacia la izquierda
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              color: _selectedTipoIncidencia == item
                                                  ? Colors.white
                                                  : Color(0xFF8B41BD),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : SizedBox.shrink(), // Si está cerrado, no ocupa espacio
                      );
                    },
                  ),
                ],
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
                    color: Color(0xFFD8E2FF),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: TextField(
                    controller: _detalleController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                      hintText: 'Escribe aquí los detalles que puedan ayudarnos a manejar tu incidente',
                      hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
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
