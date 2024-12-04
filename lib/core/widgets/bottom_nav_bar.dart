import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'label': 'Home', 'icon': Icons.home},
      {'label': 'Campus', 'icon': Icons.school},
      {'label': 'Explorar', 'icon': Icons.explore},
      {'label': 'Reporte', 'icon': Icons.report},
      {'label': 'Usuario', 'icon': Icons.person},
    ];

    return Container(
      height: 72, // Altura de la barra
      color: const Color(0xCC10130B), // Color con 80% de opacidad
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;

          bool isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'],
                  size: 24,
                  color: isSelected
                      ? Colors.white // Color activo
                      : const Color(0xFF7E7F7D), // Color inactivo
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(
                    fontFamily: 'Montserrat Alternates',
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: isSelected
                        ? Colors.white // Color activo
                        : const Color(0xFF7E7F7D), // Color inactivo
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
