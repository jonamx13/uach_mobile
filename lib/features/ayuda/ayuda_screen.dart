import 'package:flutter/material.dart';
import 'widgets/tipo_incidencia/tipo_de_incidencia.dart';
import './widgets/detalles_incidencia.dart';
import './widgets/enviar_reporte.dart';

class AyudaScreen extends StatefulWidget {
  @override
  _AyudaScreenState createState() => _AyudaScreenState();
}

class _AyudaScreenState extends State<AyudaScreen> {
  String? _selectedTipoIncidencia;
  final TextEditingController _detalleController = TextEditingController();

  void _onTipoSelected(String tipo) {
    setState(() {
      _selectedTipoIncidencia = tipo;
    });
  }

  void _onSendReport() {
    if (_selectedTipoIncidencia != null && _detalleController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reporte enviado con éxito')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                child: Center(
                  child: Text(
                    'Reportar incidencia',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 20 / 16,
                      color: Color(0xFF0E1016),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cgti_photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TipoDeIncidencia(
                          selectedTipoIncidencia: _selectedTipoIncidencia,
                          onTipoSelected: _onTipoSelected,
                        ),
                        SizedBox(height: 30),  // Separación entre TipoDeIncidencia y DetallesIncidencia
                        DetallesIncidencia(
                          detalleController: _detalleController,
                        ),
                        SizedBox(height: 8),  // Separación entre DetallesIncidencia y EnviarReporte
                        EnviarReporte(
                          onSend: _onSendReport,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
