import 'package:flutter/material.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/campus/presentation/campus_screen.dart';
import '../../features/explorar/presentation/explorar_screen.dart';
import '../../features/reporte/presentation/reporte_screen.dart';
import '../../features/user/presentation/user_overlay.dart';
import '../widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _allScreens = [
    HomeScreen(),
    CampusScreen(),
    ExplorarScreen(),
    ReporteScreen(),
    Container(), // Placeholder para el botón "Usuario"
  ];

  List<Widget> _visibleScreens = [];

  @override
  void initState() {
    super.initState();
    _visibleScreens = [_allScreens[_currentIndex]]; // Mostrar solo la actual al inicio
  }

  void _onItemSelected(int index) {
  // Evitar animación si ya estamos en la pantalla seleccionada
  if (index == _currentIndex) {
    return;
  }

  if (index == 4) {
    showUserOverlay(context); // Mostrar el overlay para "Usuario"
    return;
  }

  // Determinar la dirección de la animación
  bool isForward = index > _currentIndex;

  setState(() {
    // Configurar las pantallas visibles según la dirección
    _visibleScreens = isForward
        ? [_allScreens[_currentIndex], _allScreens[index]] // De izquierda a derecha
        : [_allScreens[index], _allScreens[_currentIndex]]; // De derecha a izquierda
  });

  // Ajustar el controlador para empezar en la posición correcta
  _pageController.jumpToPage(isForward ? 0 : 1);

  // Iniciar la animación
  _pageController
      .animateToPage(
        isForward ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
      .then((_) {
    // Tras la animación, actualizar el estado y restaurar las pantallas
    setState(() {
      _currentIndex = index;
      _visibleScreens = [_allScreens[_currentIndex]]; // Mostrar solo la pantalla destino
      _pageController.jumpToPage(0); // Asegurar estado final
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Deshabilitar swipe manual
        itemCount: _visibleScreens.length,
        itemBuilder: (context, index) => _visibleScreens[index],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
