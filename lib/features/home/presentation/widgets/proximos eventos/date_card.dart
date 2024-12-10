import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final String fecha;
  final String titulo;
  final String? hora; // Parámetro opcional
  final String? lugar; // Parámetro opcional

  const DateCard({
    Key? key,
    required this.fecha,
    required this.titulo,
    this.hora, // Parámetro opcional
    this.lugar, // Parámetro opcional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(7, 7, 7, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fecha,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 10,
              height: 1.25, // Line height = 12.5px
              color: Color(0xFF696D79),
            ),
          ),
          const SizedBox(height: 4), // Separación entre líneas
          Text(
            titulo,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              height: 1.25, // Line height = 16.25px
              color: Color(0xFF0E1016),
            ),
          ),
          const SizedBox(height: 4),
          if (hora != null) ...[ // Solo muestra la hora si no es nula
            Text(
              hora!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 10,
                height: 1.25, // Line height = 12.5px
                color: Color(0xFF696D79),
              ),
            ),
            const SizedBox(height: 4),
          ],
          if (lugar != null) ...[ // Solo muestra el lugar si no es nulo
            Text(
              lugar!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 1.25, // Line height = 15px
                color: Color(0xFF696D79),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
