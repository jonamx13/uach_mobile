import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/campus/campus_screen.dart';
import '../features/explorar/explorar_screen.dart';
import '../features/reporte/reporte_screen.dart';
import '../features/user/user_overlay.dart';

class BottomNavBarConfig {
  static List<Map<String, dynamic>> getItems(Function(int) onItemSelected) {
    return [
      {'label': 'Home', 'icon': Icons.home, 'action': () => onItemSelected(0), 'screen': HomeScreen()},
      {'label': 'Explorar', 'icon': Icons.explore, 'action': () => onItemSelected(2), 'screen': ExplorarScreen()},
      {
        'label': 'Usuario',
        'icon': Icons.person,
        'action': () => onItemSelected(4),
        'screen': UserOverlay,
        'excludeFromNavigation': true, // Marcar como excluido
      },
      {'label': 'Campus', 'icon': Icons.school, 'action': () => onItemSelected(1), 'screen': CampusScreen()},
      {'label': 'Reporte', 'icon': Icons.report, 'action': () => onItemSelected(3), 'screen': ReporteScreen()},
    ];
  }
}
