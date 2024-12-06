import 'package:flutter/material.dart';

void showUserOverlay(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Permitir ajuste dinámico de tamaño
    backgroundColor: Colors.transparent, // Fondo transparente
    builder: (context) {
      final mediaQuery = MediaQuery.of(context);
      final bottomNavBarHeight = 72.0; // Altura del BottomNavBar personalizado (ajústala si varía)
      final overlayHeight = mediaQuery.size.height -
          mediaQuery.padding.top - // Espacio seguro superior
          bottomNavBarHeight; // Altura del BottomNavBar

      return GestureDetector(
        onTap: () => Navigator.pop(context), // Cerrar el overlay al hacer tap fuera
        child: Stack(
          children: [
            // Fondo con modo de fusión multiply
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: overlayHeight, // Respetar el espacio del BottomNavBar
                decoration: BoxDecoration(
                  color: const Color(0xFFB5ADBA).withOpacity(0.8),
                ),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.multiply,
                  ),
                  child: Container(),
                ),
              ),
            ),
            // Botones alineados al fondo del overlay
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16), // Margen interior
                child: GestureDetector(
                  onTap: () {}, // Absorber taps en los botones
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildButton(context, "SEGA"),
                      _buildButton(context, "PAGOS"),
                      _buildButton(context, "CAMPUS VIRTUAL"),
                      _buildButton(context, "TRÁMITES"),
                      _buildFlatButton(context, "CERRAR"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildButton(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
      onPressed: () {
        // Acción del botón
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
  );
}

Widget _buildFlatButton(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(), // Sin bordes redondeados
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
      onPressed: () {
        // Acción del botón
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
  );
}
