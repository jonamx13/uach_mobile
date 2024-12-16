import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  final bool isOverlayVisible;
  final VoidCallback onDismissOverlay;
  final double height;
  final List<Map<String, dynamic>> items;  // Recibimos la lista de items como parámetro

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.isOverlayVisible,
    required this.onDismissOverlay,
    required this.height,
    required this.items, // Recibimos la lista
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cintilloHeight = 10.0;
    double adjustedHeight = height - cintilloHeight;

    return Column(
      children: [
        Image.asset(
          'assets/images/cintillo_facultades.png',
          width: MediaQuery.of(context).size.width,
          height: cintilloHeight,
          fit: BoxFit.cover,
        ),
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
