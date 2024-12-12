import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  final bool isOverlayVisible;
  final VoidCallback onDismissOverlay;
  final double height;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.isOverlayVisible,
    required this.onDismissOverlay,
    required this.height
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

    // Altura de la imagen del cintillo
    double cintilloHeight = 10.0;  // Ajusta este valor si la imagen tiene otra altura
    double adjustedHeight = height - cintilloHeight; // Restamos la altura de la imagen

    return Column(
      children: [
        // Cintillo con la imagen
        Image.asset(
          'assets/images/cintillo_facultades.png',
          width: MediaQuery.of(context).size.width,
          height: cintilloHeight,
          fit: BoxFit.cover,
        ),

        // Container debajo de la imagen
        Container(
          height: adjustedHeight,
          color: const Color(0xFF463868),
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
                      color: isSelected ? Colors.white : const Color(0xFF7E7F7D),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'],
                      style: TextStyle(
                        fontFamily: 'Montserrat Alternates',
                        fontWeight: FontWeight.w900,
                        fontSize: 10,
                        color: isSelected ? Colors.white : const Color(0xFF7E7F7D),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
