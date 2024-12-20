import 'package:flutter/material.dart';
import 'facultad_dropdown_button.dart';
import 'facultad_dropdown_overlay.dart';

class FacultadDropdown extends StatefulWidget {
  @override
  _FacultadDropdownState createState() => _FacultadDropdownState();
}

class _FacultadDropdownState extends State<FacultadDropdown> with SingleTickerProviderStateMixin {
  String selectedFacultad = 'Facultad'; // Valor por defecto
  final List<String> facultades = [
    'Artes',
    'Ciéncias Agrícolas y Forestales',
    'Ciencias Agrotecnológicas',
    'Ciencias de la Cultura Física',
    'Ciencias Políticas y Sociales',
    'Ciencias Químicas',
    'Contaduría y Administración',
  ];

  OverlayEntry? _overlayEntry;
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // Animación de opacidad para el fondo
    _opacityAnimation = Tween<double>(begin: 0, end: 0.5).animate(_animationController!);

    // Animación de escala vertical (solo eje Y)
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _showDropdown() {
    final overlay = Overlay.of(context)!;
    _overlayEntry = FacultadDropdownOverlay(
      context: context,
      animationController: _animationController!,
      opacityAnimation: _opacityAnimation!,
      scaleAnimation: _scaleAnimation!,
      facultades: facultades,
      onSelect: (facultad) {
        setState(() {
          selectedFacultad = facultad;
        });
        _closeDropdown();
      },
      currentSelection: selectedFacultad, // Pasamos el texto actual al overlay
    ).createOverlayEntry();

    overlay.insert(_overlayEntry!);
    _animationController?.forward(); // Iniciar la animación
  }

  void _closeDropdown() {
    _animationController?.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FacultadDropdownButton(
      onPressed: () {
        if (_overlayEntry == null) {
          _showDropdown();
        } else {
          _closeDropdown();
        }
      },
      selectedFacultad: selectedFacultad,
    );
  }
}
