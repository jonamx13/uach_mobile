import 'package:flutter/material.dart';

class FacultadButton extends StatelessWidget {
  final String selectedFacultad;
  final VoidCallback onPressed;

  FacultadButton({required this.selectedFacultad, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,  // Acción al presionar el botón
        child: Text(
          selectedFacultad,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0E1016),
          ),
        ),
      ),
    );
  }
}
