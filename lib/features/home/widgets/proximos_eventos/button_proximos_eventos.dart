import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importar flutter_svg

class ButtonProximosEventos extends StatelessWidget {
  final bool isActive;
  final String iconPath;  // Cambio: Cambiar IconData por String para la ruta del SVG
  final String text;
  final VoidCallback onTap;

  const ButtonProximosEventos({
    Key? key,
    required this.isActive,
    required this.iconPath,  // Cambio aquí también
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
          color: isActive ? Colors.white : Colors.transparent, // Cambiar el color de fondo
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(color: Colors.white, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,  // Usar la ruta del SVG sin aplicar color
              width: 28,  // Ajustar el tamaño según sea necesario
              height: 28,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: isActive ? const Color(0xFF401E57) : const Color(0xFF401E57), // Color del texto se mantiene
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
