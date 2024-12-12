import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final VoidCallback onClose;
  final FocusNode focusNode;
  final TextEditingController controller;

  SearchBarCustom({
    required this.onClose,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 15,
      right: 15,
      child: GestureDetector(
        onTap: () {
          // Si se toca fuera del TextField, cerrar la búsqueda
          FocusScope.of(context).requestFocus(FocusNode());
          onClose();  // Cierra la barra de búsqueda
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    // Cuando se presiona "Enter", borrar el texto y cerrar la búsqueda
                    controller.clear();
                    onClose();  // Cierra la barra de búsqueda
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
