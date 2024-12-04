import 'package:flutter/material.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/campus/presentation/campus_screen.dart';
import '../features/explorar/presentation/explorar_screen.dart';
import '../features/reporte/presentation/reporte_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String campus = '/campus';
  static const String explorar = '/explorar';
  static const String reporte = '/reporte';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case campus:
        return MaterialPageRoute(builder: (_) => CampusScreen());
      case explorar:
        return MaterialPageRoute(builder: (_) => ExplorarScreen());
      case reporte:
        return MaterialPageRoute(builder: (_) => ReporteScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Página no encontrada')),
          ),
        );
    }
  }
}
