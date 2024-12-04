import 'package:flutter/material.dart';

void showUserOverlay(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.all(16),
      height: 200,
      child: Column(
        children: [
          Text('Opciones de Usuario', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar Sesión'),
          ),
        ],
      ),
    ),
  );
}
