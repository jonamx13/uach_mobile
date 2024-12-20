import 'package:flutter/material.dart';

class FacultadDropdownButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String selectedFacultad;

  const FacultadDropdownButton({
    Key? key,
    required this.onPressed,
    required this.selectedFacultad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
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
