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
  // Estados para los tres botones
  bool _isButton1Active = false; // Deportivos
  bool _isButton2Active = true;  // Artístico (por defecto activo)
  bool _isButton3Active = false; // Científico-filosófico

  void _toggleButton(int buttonIndex) {
    setState(() {
      _isButton1Active = buttonIndex == 1;
      _isButton2Active = buttonIndex == 2;
      _isButton3Active = buttonIndex == 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventos = _isButton1Active
        ? calendarioData // Datos para "Deportivos"
        : _isButton2Active
            ? noticias // Datos para "Artístico"
            : calendarioData; // Datos para "Científico-filosófico" (actualiza según corresponda)

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
                    ? 'assets/icons/sports_Active.svg'
                    : 'assets/icons/sports_Inactive.svg',
                text: 'Deportivos',
                onTap: () => _toggleButton(1),
              ),
              const SizedBox(width: 20),
              ButtonProximosEventos(
                isActive: _isButton2Active,
                iconPath: _isButton2Active
                    ? 'assets/icons/quaver_Active.svg'
                    : 'assets/icons/quaver_Inactive.svg',
                text: 'Artístico',
                onTap: () => _toggleButton(2),
              ),
              const SizedBox(width: 20),
              ButtonProximosEventos(
                isActive: _isButton3Active,
                iconPath: _isButton3Active
                    ? 'assets/icons/science_Active.svg'
                    : 'assets/icons/science_Inactive.svg',
                text: 'Científico-filosófico',
                onTap: () => _toggleButton(3),
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
                // Modo Deportivos
                return DateCard(
                  fecha: evento["fechaCalendario"]!,
                  titulo: evento["tituloCalendario"]!,
                  hora: null, // Sin hora
                  lugar: null, // Sin lugar
                );
              } else if (_isButton2Active) {
                // Modo Artístico
                return DateCard(
                  fecha: evento["fechaDateCard"]!,
                  titulo: evento["titulo"]!,
                  hora: evento["hora"]!,
                  lugar: evento["lugar"]!,
                );
              } else {
                // Modo Científico-filosófico (actualiza datos si cambian)
                return DateCard(
                  fecha: evento["fechaCalendario"]!,
                  titulo: evento["tituloCalendario"]!,
                  hora: null, // Ejemplo: Añadir hora si aplica
                  lugar: null, // Ejemplo: Añadir lugar si aplica
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
