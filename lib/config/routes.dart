import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/directorio/directorio_screen.dart';
import '../features/mapa/mapa_screen.dart';
import '../features/ayuda/ayuda_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String directorio = '/directorio';
  static const String mapa = '/mapa';
  static const String ayuda = '/ayuda';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case directorio:
        return MaterialPageRoute(builder: (_) => DirectorioScreen());
      case mapa:
        return MaterialPageRoute(builder: (_) => MapaScreen());
      case ayuda:
        return MaterialPageRoute(builder: (_) => AyudaScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Página no encontrada')),
          ),
        );
    }
  }
}
