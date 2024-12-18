import 'package:flutter/material.dart';

class TipoDeIncidenciaList extends StatelessWidget {
  final String? selectedTipoIncidencia;
  final Function(String) onTipoSelected;

  const TipoDeIncidenciaList({
    Key? key,
    required this.onTipoSelected,
    required this.selectedTipoIncidencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      'Problema con las plataformas virtuales',
      'Emergencia médica',
      'Peligro de inseguridad',
      'Asistencia mecánica',
      'Violencia de género',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.map((item) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                onTipoSelected(item);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                color: selectedTipoIncidencia == item
                    ? Color(0xFF767E94)
                    : Color(0xFFE5ECFF),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: selectedTipoIncidencia == item
                          ? Colors.white
                          : Color(0xFF8B41BD),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xFFD8E2FF),
              thickness: 1,
              height: 1,
            ),
          ],
        );
      }).toList(),
    );
  }
}
