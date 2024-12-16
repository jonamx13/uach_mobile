import 'package:flutter/material.dart';
import '../../features/user/user_overlay.dart';
import '../widgets/bottom_nav_bar.dart';
import 'contacto_y_utilidades.dart';
import 'search_bar_custom.dart';
import '../../config/bottom_nav_bar_config.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isOverlayVisible = false;
  bool _isMenuVisible = false;
  bool _isSearchVisible = false;
  late FocusNode _searchFocusNode;
  TextEditingController _searchController = TextEditingController();

  final GlobalKey _bottomNavBarKey = GlobalKey();

  late List<Map<String, dynamic>> _bottomNavItems;
  List<Widget> _visibleScreens = [];

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();

    // Cargamos los ítems desde la configuración central
    _bottomNavItems = BottomNavBarConfig.getItems(_onItemSelected);

    // Excluimos "Usuario" al construir las pantallas visibles
    _visibleScreens = _bottomNavItems
        .where((item) => !(item['excludeFromNavigation'] ?? false))
        .map((item) => item['screen'] as Widget)
        .toList();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    if (index == _currentIndex) return;

    // Lógica especial para "Usuario" (índice dinámico)
    if (_bottomNavItems[index]['label'] == 'Usuario') {
      setState(() {
        _isOverlayVisible = !_isOverlayVisible;
        if (_isMenuVisible) _isMenuVisible = false;
      });
      return;
    }

    if (_isSearchVisible) {
      setState(() {
        _isSearchVisible = false;
      });
    }

    if (_isOverlayVisible) {
      _hideOverlay();
    }

    bool isForward = index > _currentIndex;

    setState(() {
      _visibleScreens = isForward
          ? [_bottomNavItems[_currentIndex]['screen'], _bottomNavItems[index]['screen']]
          : [_bottomNavItems[index]['screen'], _bottomNavItems[_currentIndex]['screen']];
    });

    _pageController.jumpToPage(isForward ? 0 : 1);

    _pageController.animateToPage(
      isForward ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ).then((_) {
      setState(() {
        _currentIndex = index;
        _visibleScreens = [_bottomNavItems[_currentIndex]['screen']];
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
      if (_isOverlayVisible) _isOverlayVisible = false;
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
      if (_isMenuVisible) _isMenuVisible = false;
    });

    if (_isSearchVisible) {
      Future.delayed(Duration(milliseconds: 100), () {
        FocusScope.of(context).requestFocus(_searchFocusNode);
      });
    }
  }

  void _closeSearch() {
    setState(() {
      _isSearchVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double bottomNavBarHeight = _getBottomNavBarHeight(context);

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_isSearchVisible) {
                FocusScope.of(context).unfocus();
                _closeSearch();
              }
            },
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _visibleScreens.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: bottomNavBarHeight),
                  child: _visibleScreens[index],
                );
              },
            ),
          ),
          if (_isOverlayVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: bottomNavBarHeight,
              child: UserOverlay(onDismiss: _hideOverlay),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              key: _bottomNavBarKey,
              currentIndex: _currentIndex,
              onItemSelected: _onItemSelected,
              isOverlayVisible: _isOverlayVisible,
              onDismissOverlay: _hideOverlay,
              height: bottomNavBarHeight,
              items: _bottomNavItems, // Pasamos todos los ítems
            ),
          ),

          // Aquí el widget ContactoYUtilidades ocupa toda la pantalla (sin sobrepasar la SafeArea)
          if (_isMenuVisible)
            Positioned.fill(
              child: Material(
                color: Colors.transparent, // Sin fondo, solo cubriendo
                child: SafeArea(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ContactoYUtilidades(onClose: _closeMenu),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isSearchVisible)
            SearchBarCustom(
              onClose: _closeSearch,
              focusNode: _searchFocusNode,
              controller: _searchController,
            ),
          
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
    );
  }

  double _getBottomNavBarHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double proportion = 72.0 / 812.0;
    return screenHeight * proportion;
  }
}
