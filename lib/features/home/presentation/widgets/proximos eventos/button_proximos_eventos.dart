import 'package:flutter/material.dart';

class ButtonProximosEventos extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ButtonProximosEventos({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Asegura que todo el área sea clicable
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF8B41BD) : const Color(0xFFD8E2FF),
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(color: Colors.white, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : const Color(0xFF401E57),
              size: 28,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF401E57),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
