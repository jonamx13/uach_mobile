import 'package:flutter/material.dart';
import './tipo_de_incidencia_list.dart';

class TipoDeIncidenciaDropdown extends StatefulWidget {
  final String? selectedTipoIncidencia;
  final Function(String) onTipoSelected;

  const TipoDeIncidenciaDropdown({
    Key? key,
    required this.selectedTipoIncidencia,
    required this.onTipoSelected,
  }) : super(key: key);

  @override
  _TipoDeIncidenciaDropdownState createState() =>
      _TipoDeIncidenciaDropdownState();
}

class _TipoDeIncidenciaDropdownState extends State<TipoDeIncidenciaDropdown>
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
        left: position.dx,
        top: position.dy + renderBox.size.height,
        width: renderBox.size.width,
        child: Material(
          elevation: 2.0,
          child: SizeTransition(
            sizeFactor: _sizeAnimation,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TipoDeIncidenciaList(
                onTipoSelected: widget.onTipoSelected,
                selectedTipoIncidencia: widget.selectedTipoIncidencia,
              ),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(_dropdownOverlay!);
    _animationController.forward();
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
    double containerWidth = MediaQuery.of(context).size.width - 64;

    return GestureDetector(
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
    );
  }
}
