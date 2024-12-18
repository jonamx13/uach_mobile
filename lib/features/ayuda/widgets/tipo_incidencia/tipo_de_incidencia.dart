import 'package:flutter/material.dart';
import './tipo_de_incidencia_dropdown.dart';

class TipoDeIncidencia extends StatefulWidget {
  final String? selectedTipoIncidencia;
  final Function(String) onTipoSelected;

  const TipoDeIncidencia({
    Key? key,
    required this.selectedTipoIncidencia,
    required this.onTipoSelected,
  }) : super(key: key);

  @override
  _TipoDeIncidenciaState createState() => _TipoDeIncidenciaState();
}

class _TipoDeIncidenciaState extends State<TipoDeIncidencia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 10),
          child: Text(
            'Tipo de incidencia',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color(0xFF8B41BD),
            ),
          ),
        ),
        TipoDeIncidenciaDropdown(
          selectedTipoIncidencia: widget.selectedTipoIncidencia,
          onTipoSelected: widget.onTipoSelected,
        ),
      ],
    );
  }
}
