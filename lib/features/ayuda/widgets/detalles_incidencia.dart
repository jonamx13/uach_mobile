import 'package:flutter/material.dart';

class DetallesIncidencia extends StatelessWidget {
  final TextEditingController detalleController;
  final double minHeight; // Altura mínima controlable

  const DetallesIncidencia({
    Key? key,
    required this.detalleController,
    this.minHeight = 150.0, // Valor por defecto de altura mínima
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Proporciona detalles',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Color(0xFF8B41BD),
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD8E2FF),
            borderRadius: BorderRadius.zero,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: minHeight, // Altura mínima especificada
            ),
            child: TextField(
              controller: detalleController,
              maxLines: null,
              expands: false, // Permite que crezca sin límites
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.0),
                hintText:
                    'Escribe aquí los detalles que puedan ayudarnos a manejar tu incidente',
                hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
