import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rotating_icon.dart';
import 'dart:math';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  final bool isOverlayVisible;
  final VoidCallback onDismissOverlay;
  final double height;
  final List<Map<String, dynamic>> items;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.isOverlayVisible,
    required this.onDismissOverlay,
    required this.height,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cintilloHeight = 10.0;
    double adjustedHeight = height - cintilloHeight;

    return Column(
      children: [
        // Cintillo en la parte superior
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
                    // Si el ícono es 'rotating_icon', mostramos RotatingIcon
                    item['icon'] == 'rotating_icon'
                        ? RotatingIcon(
                            rotation: isSelected ? pi / 2 : 0.0, // Cambiar rotación según isSelected
                          )
                        : SvgPicture.asset(
                            item['icon'],
                            width: 24,
                            height: 24,
                            color: isSelected ? Colors.white : const Color(0xFF1D1B20),
                          ),
                    // Solo mostrar texto si no es 'rotating_icon'
                    if (item['icon'] != 'rotating_icon') ...[
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
