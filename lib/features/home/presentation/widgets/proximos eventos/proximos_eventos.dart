import 'package:flutter/material.dart';
import 'button_proximos_eventos.dart';
import 'date_card.dart';
import '../../data/noticias_data.dart';
import '../../data/calendario_data.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importar flutter_svg

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
  }

  @override
  Widget build(BuildContext context) {
    final eventos = _isButton1Active ? calendarioData : noticias;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15), // Padding horizontal
      child: Column(
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
          const SizedBox(height: 20), // Espaciado entre título y botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonProximosEventos(
                isActive: _isButton1Active,
                iconPath: _isButton1Active
                    ? 'assets/icons/calendar_Active.svg'
                    : 'assets/icons/calendar_Inactive.svg', // Cambio dinámico
                text: 'Calendario',
                onTap: () => _toggleButton(1),
              ),
              const SizedBox(width: 20),
              ButtonProximosEventos(
                isActive: _isButton2Active,
                iconPath: _isButton2Active
                    ? 'assets/icons/quaver_Active.svg'
                    : 'assets/icons/quaver_Inactive.svg', // Cambio dinámico
                text: 'Eventos',
                onTap: () => _toggleButton(2),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(), // Desactiva scroll interno
            shrinkWrap: true, // Ajusta el tamaño al contenido
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              final evento = eventos[index];
              if (_isButton1Active) {
                // Modo Calendario
                return DateCard(
                  fecha: evento["fechaCalendario"]!,
                  titulo: evento["tituloCalendario"]!,
                  hora: null, // Sin hora
                  lugar: null, // Sin lugar
                );
              } else {
                // Modo Eventos
                return DateCard(
                  fecha: evento["fechaDateCard"]!,
                  titulo: evento["titulo"]!,
                  hora: evento["hora"]!,
                  lugar: evento["lugar"]!,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
