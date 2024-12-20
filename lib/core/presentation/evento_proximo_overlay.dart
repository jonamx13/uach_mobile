import 'package:flutter/material.dart';

class EventoProximoOverlay extends StatelessWidget {
  final VoidCallback onDismiss;

  const EventoProximoOverlay({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo negro semitransparente
        Container(
          color: Colors.black.withOpacity(0.5), // Fondo negro transparente
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Botón de cerrar en la parte superior derecha
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Fondo blanco del botón
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5), // Bordes cuadrados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Color(0xFF6750A4)),
                        padding: EdgeInsets.zero, // Elimina el padding extra del botón
                        onPressed: onDismiss,
                      ),
                    ),
                  ),
                ],
              ),
              // Imagen envuelta en un contenedor con fondo blanco
              Container(
                
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(5), // Espacio entre la imagen y el borde blanco
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/evento_splash.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
