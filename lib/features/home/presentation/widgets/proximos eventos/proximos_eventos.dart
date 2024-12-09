import 'package:flutter/material.dart';
import 'button_proximos_eventos.dart';

class ProximosEventos extends StatefulWidget {
  const ProximosEventos({Key? key}) : super(key: key);

  @override
  _ProximosEventosState createState() => _ProximosEventosState();
}

class _ProximosEventosState extends State<ProximosEventos> {
  bool _isButton1Active = true;
  bool _isButton2Active = false;

  void _toggleButton(int buttonIndex) {
    setState(() {
      _isButton1Active = buttonIndex == 1;
      _isButton2Active = buttonIndex == 2;
    });
    debugPrint('Botón activo: ${buttonIndex == 1 ? "Calend" : "Eventos"}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tus próximos eventos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B41BD),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Espaciado ajustado para botones
          ],
        ),
        Positioned(
          top: 35,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonProximosEventos(
                isActive: _isButton1Active,
                icon: Icons.event,
                text: 'Calendario',
                onTap: () => _toggleButton(1),
              ),
              const SizedBox(width: 20),
              ButtonProximosEventos(
                isActive: _isButton2Active,
                icon: Icons.schedule,
                text: 'Eventos',
                onTap: () => _toggleButton(2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
