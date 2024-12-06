import 'package:flutter/material.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/campus/presentation/campus_screen.dart';
import '../../features/explorar/presentation/explorar_screen.dart';
import '../../features/reporte/presentation/reporte_screen.dart';
import '../../features/user/presentation/user_overlay.dart';
import '../widgets/bottom_nav_bar.dart';
import '../utils/screen_utils.dart';

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
    if (index == _currentIndex) return; // No hacer nada si es la misma pantalla
    if (index == 4) {
      showUserOverlay(context); // Mostrar overlay para el botón "Usuario"
      return;
    }

    bool isForward = index > _currentIndex;

    setState(() {
      _visibleScreens = isForward
          ? [_allScreens[_currentIndex], _allScreens[index]]
          : [_allScreens[index], _allScreens[_currentIndex]];
    });

    _pageController.jumpToPage(isForward ? 0 : 1);

    _pageController
        .animateToPage(
          isForward ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
        .then((_) {
      setState(() {
        _currentIndex = index;
        _visibleScreens = [_allScreens[_currentIndex]];
        _pageController.jumpToPage(0);
      });
    });
  }

  double getVisibleHeight(BuildContext context, {required int bottomNavBarHeight}) {
  return getVisibleHeight(context, bottomNavBarHeight: 72); // Usa la función compartida
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
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
