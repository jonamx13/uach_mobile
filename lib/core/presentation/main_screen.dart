import 'package:flutter/material.dart';
import '../../features/home/home_screen.dart';
import '../../features/campus/campus_screen.dart';
import '../../features/explorar/explorar_screen.dart';
import '../../features/reporte/reporte_screen.dart';
import '../../features/user/user_overlay.dart';
import '../widgets/bottom_nav_bar.dart';
import 'contacto_y_utilidades.dart';
import 'search_bar_custom.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isOverlayVisible = false;
  bool _isMenuVisible = false; // Para controlar la visibilidad del menú desplegable
  bool _isSearchVisible = false; // Para controlar la visibilidad de la barra de búsqueda

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
    if (index == _currentIndex) return;

    if (index == 4) {
      // Si seleccionamos el botón de usuario, mostramos el overlay
      setState(() {
        _isOverlayVisible = !_isOverlayVisible;
        if (_isMenuVisible) _isMenuVisible = false; // Cerrar menú si está abierto
      });
      return;
    }

    // Cuando se hace tap en cualquier otro botón, ocultamos el overlay
    if (_isOverlayVisible) {
      _hideOverlay();
    }

    bool isForward = index > _currentIndex;

    setState(() {
      _visibleScreens = isForward
          ? [_allScreens[_currentIndex], _allScreens[index]]
          : [_allScreens[index], _allScreens[_currentIndex]];
    });

    _pageController.jumpToPage(isForward ? 0 : 1);

    _pageController.animateToPage(
      isForward ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ).then((_) {
      setState(() {
        _currentIndex = index;
        _visibleScreens = [_allScreens[_currentIndex]];
        _pageController.jumpToPage(0);
      });
    });
  }

  void _hideOverlay() {
    setState(() {
      _isOverlayVisible = false;
    });
  }

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
      if (_isOverlayVisible) _isOverlayVisible = false; // Cerrar overlay si está abierto
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuVisible = false;
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (_isMenuVisible) _isMenuVisible = false; // Cerrar menú si está abierto
    });
  }

  void _closeSearch() {
    setState(() {
      _isSearchVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _visibleScreens.length,
            itemBuilder: (context, index) => _visibleScreens[index],
          ),
          if (_isOverlayVisible)
            UserOverlay(onDismiss: _hideOverlay),
          if (_isMenuVisible)
            ContactoYUtilidades(onClose: _closeMenu),
          if (_isSearchVisible)
            SearchBarCustom(onClose: _closeSearch),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 15,
            child: Row(
              children: [
                if (!_isMenuVisible && !_isOverlayVisible && !_isSearchVisible)
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: _toggleSearch,
                  ),
                if (!_isMenuVisible && !_isOverlayVisible && !_isSearchVisible)
                  SizedBox(width: 0),
                if (!_isMenuVisible && !_isOverlayVisible && !_isSearchVisible)
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: _toggleMenu,
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemSelected,
        isOverlayVisible: _isOverlayVisible,
        onDismissOverlay: _hideOverlay,
      ),
    );
  }
}
