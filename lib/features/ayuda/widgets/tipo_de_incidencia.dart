import 'package:flutter/material.dart';

class TipoDeIncidencia extends StatefulWidget {
  final String? selectedTipoIncidencia;
  final Function(String) onTipoSelected;

  const TipoDeIncidencia({
    Key? key,
    required this.selectedTipoIncidencia,
    required this.onTipoSelected,
  }) : super(key: key);

  @override
  _TipoDeIncidenciaState createState() => _TipoDeIncidenciaState();
}

class _TipoDeIncidenciaState extends State<TipoDeIncidencia>
    with SingleTickerProviderStateMixin {
  bool _isDropdownOpen = false;
  OverlayEntry? _dropdownOverlay;
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx, // Ajuste el left para alinear con el padre
        top: position.dy + renderBox.size.height,
        width: renderBox.size.width, // Ajustar el ancho igual que el padre
        child: Material(
          elevation: 2.0,
          child: SizeTransition(
            sizeFactor: _sizeAnimation,
            axis: Axis.vertical,
            axisAlignment: -1.0, // Anima desde la parte superior
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ajusta la altura según el contenido
                children: <String>[
                  'Problema con las plataformas virtuales',
                  'Emergencia médica',
                  'Peligro de inseguridad',
                  'Asistencia mecánica',
                  'Violencia de género'
                ].map((String item) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.onTipoSelected(item);
                          _closeDropdown();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          color: widget.selectedTipoIncidencia == item
                              ? Color(0xFF767E94)
                              : Color(0xFFE5ECFF),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: widget.selectedTipoIncidencia == item
                                    ? Colors.white
                                    : Color(0xFF8B41BD),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFD8E2FF),
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(_dropdownOverlay!);
    _animationController.forward(); // Iniciar la animación de escala
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _animationController.reverse().then((_) {
      _dropdownOverlay?.remove();
      setState(() {
        _isDropdownOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 64; // Esto asegura que ambos containers tengan el mismo ancho

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 10),
          child: Text(
            'Tipo de incidencia',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Color(0xFF8B41BD),
            ),
          ),
        ),
        GestureDetector(
          onTap: _toggleDropdown,
          child: Container(
            decoration: BoxDecoration(
              color: _isDropdownOpen ? Color(0xFF767E94) : Color(0xFFD8E2FF),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            width: containerWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedTipoIncidencia ?? 'Selecciona el tipo de incidencia',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: _isDropdownOpen ? Colors.white : Color(0xFF362B3E),
                  ),
                ),
                Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: _isDropdownOpen ? Colors.white : Color(0xFF8B41BD),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
