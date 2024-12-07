import 'package:flutter/material.dart';
import 'overlay_button.dart';

class UserOverlay extends StatefulWidget {
  final VoidCallback onDismiss;

  const UserOverlay({Key? key, required this.onDismiss}) : super(key: key);

  @override
  _UserOverlayState createState() => _UserOverlayState();
}

class _UserOverlayState extends State<UserOverlay> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Crear controlador de animación
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    // Crear animación de opacidad, con valores de 0 a 1
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    // Iniciar la animación para mostrar el overlay
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  // Método para manejar el cierre del overlay con animación inversa
  void _dismissOverlay() {
    _fadeController.reverse().then((_) {
      widget.onDismiss(); // Llamar al onDismiss solo después de la animación de cierre
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value, // Aplica la animación de opacidad
          child: GestureDetector(
            onTap: _dismissOverlay, // Cierra al tocar el fondo con animación inversa
            child: Container(
              color: const Color(0xFF8B41BD).withOpacity(0.5), // Fondo negro con opacidad del 50%
              padding: const EdgeInsets.symmetric(horizontal: 20), // Padding lateral
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OverlayButton(
                    label: "SEGA",
                    onPressed: () {},
                  ),
                  OverlayButton(
                    label: "PAGOS",
                    onPressed: () {},
                  ),
                  OverlayButton(
                    label: "CAMPUS VIRTUAL",
                    onPressed: () {},
                  ),
                  OverlayButton(
                    label: "TRÁMITES",
                    onPressed: () {},
                  ),
                  OverlayButton(
                    label: "CERRAR",
                    onPressed: _dismissOverlay, // Usar el método para cerrar
                    isCerrar: true, // Botón "CERRAR"
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
