import 'package:flutter/material.dart';
import 'facultad_dropdown_menu.dart';

class FacultadDropdownOverlay {
  final BuildContext context;
  final AnimationController animationController;
  final Animation<double> opacityAnimation;
  final Animation<double> scaleAnimation;
  final List<String> facultades;
  final Function(String) onSelect;
  final String currentSelection;

  FacultadDropdownOverlay({
    required this.context,
    required this.animationController,
    required this.opacityAnimation,
    required this.scaleAnimation,
    required this.facultades,
    required this.onSelect,
    required this.currentSelection, // Agregar el texto actual
  });

  OverlayEntry createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Solo cierra el overlay sin cambiar el texto si no hay selección
          if (currentSelection == "") {
            onSelect(""); // Si el texto estaba vacío, cerramos sin hacer cambios
          } else {
            onSelect(currentSelection); // Mantener el texto actual si no hay selección
          }
        },
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Stack(
              children: [
                // Fondo con opacidad animada
                AnimatedOpacity(
                  opacity: opacityAnimation.value,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    color: Colors.black.withOpacity(opacityAnimation.value),
                  ),
                ),
                // SafeArea envuelve el dropdown con ScaleTransition solo en el eje Y
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Transform(
                      transform: Matrix4.diagonal3Values(1, scaleAnimation.value, 1),
                      alignment: Alignment.topCenter,
                      child: FacultadDropdownMenu(
                        facultades: facultades,
                        onSelect: onSelect,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
