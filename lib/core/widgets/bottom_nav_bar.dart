import 'package:flutter/material.dart';
import '../../features/user/presentation/user_overlay.dart'; // Asegúrate de que este import esté presente

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  final bool isOverlayVisible;
  final VoidCallback onDismissOverlay;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.isOverlayVisible,
    required this.onDismissOverlay,
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
      height: 72,
      color: const Color(0xCC10130B),
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
                      ? Colors.white
                      : const Color(0xFF7E7F7D),
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(
                    fontFamily: 'Montserrat Alternates',
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: isSelected
                        ? Colors.white
                        : const Color(0xFF7E7F7D),
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
