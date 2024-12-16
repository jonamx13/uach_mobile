import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/directorio/directorio_screen.dart';
import '../features/mapa/mapa_screen.dart';
import '../features/ayuda/ayuda_screen.dart';
import '../features/user/user_overlay.dart';

class BottomNavBarConfig {
  static List<Map<String, dynamic>> getItems(Function(int) onItemSelected) {
    return [
      {'label': 'Inicio', 'icon': Icons.home, 'action': () => onItemSelected(0), 'screen': HomeScreen()},
      {'label': 'Mapa', 'icon': Icons.explore, 'action': () => onItemSelected(2), 'screen': MapaScreen()},
      {
        'label': 'Usuario',
        'icon': Icons.person,
        'action': () => onItemSelected(4),
        'screen': UserOverlay,
        'excludeFromNavigation': true, // Marcar como excluido
      },
      {'label': 'Ayuda', 'icon': Icons.report, 'action': () => onItemSelected(3), 'screen': AyudaScreen()},
      {'label': 'Directorio', 'icon': Icons.school, 'action': () => onItemSelected(1), 'screen': DirectorioScreen()},
    ];
  }
}
