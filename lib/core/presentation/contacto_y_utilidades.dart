import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactoYUtilidades extends StatefulWidget {
  final VoidCallback onClose;

  ContactoYUtilidades({required this.onClose});

  @override
  _ContactoYUtilidadesState createState() => _ContactoYUtilidadesState();
}

class _ContactoYUtilidadesState extends State<ContactoYUtilidades> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeOverlay() {
    _animationController.reverse().then((value) => widget.onClose());
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        color: Color(0xFFF0F6FD),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0), // Margen solo del lado izquierdo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón de cierre
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: _closeOverlay,
                  ),
                ),
                // Scroll para evitar overflow
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 40,
                            child: Image.asset('assets/images/logo_uach_movil.png'),
                          ),
                        ),
                        // Sección "Estudiantes"
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Estudiantes',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 17.5 / 14,
                              color: Color(0xFF0E1016),
                            ),
                          ),
                        ),
                        ..._buildButtons([
                          {'title': 'Calendario escolar', 'icon': 'calendario_escolar.svg'},
                          {'title': 'Biblioteca', 'icon': 'biblioteca.svg'},
                          {'title': 'Credencial única', 'icon': 'credencial_unica.svg'},
                          {'title': 'Carnet integral de la salud', 'icon': 'carnet_integral_de_salud.svg'},
                          {'title': 'Catálogo de servicios', 'icon': 'catalogo_de_servicios.svg'},
                          {'title': 'Bolsa de trabajo', 'icon': 'bolsa_de_trabajo.svg'},
                          {'title': 'Diplomado en idiomas', 'icon': 'diplomado_en_idiomas.svg'},
                          {'title': 'Becas', 'icon': 'becas.svg'},
                        ]),
                        // Sección "Redes Sociales"
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Redes Sociales',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 17.5 / 14,
                              color: Color(0xFF0E1016),
                            ),
                          ),
                        ),
                        ..._buildButtons([
                          {'title': 'Facebook', 'icon': 'facebook.svg'},
                          {'title': 'Instagram', 'icon': 'instagram.svg'},
                          {'title': 'X', 'icon': 'x.svg'},
                          {'title': 'Youtube', 'icon': 'youtube.svg'},
                          {'title': 'TikTok', 'icon': 'tiktok.svg'},
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(List<Map<String, String>> items) {
    return items.map((item) {
      return Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/contacto_y_utilidades/${item['icon']}',
              width: 24,
              height: 24,
            ),
            title: Text(
              item['title']!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 16.8 / 12,
                color: Color(0xFF1E1E1E),
              ),
            ),
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          Divider(color: Color(0xFFE0E0E0)),
        ],
      );
    }).toList();
  }
}
