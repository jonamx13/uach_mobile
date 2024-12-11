import 'package:flutter/material.dart';

class OverlayButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isCerrar; // Propiedad para verificar si es el botón CERRAR

  const OverlayButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isCerrar = false, // Por defecto no es el botón CERRAR
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCerrar ? const Color(0xFF8B41BD) : const Color(0xFFD8E2FF),
          foregroundColor: isCerrar ? Colors.white : const Color(0xFF401E57),
          shape: isCerrar
              ? const BeveledRectangleBorder() // Sin bordes redondeados para CERRAR
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 32,
            height: 1.25, // Interlineado de 40px
          ),
        ),
      ),
    );
  }
}
