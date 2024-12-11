import 'package:flutter/material.dart';
import 'overlay_button.dart';
import 'overlay_animation_wrapper.dart';

class UserOverlay extends StatelessWidget {
  final VoidCallback onDismiss;

  const UserOverlay({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {"label": "SEGA", "iconPath": "assets/icons/sega.svg"},
      {"label": "Campus Virtual", "iconPath": "assets/icons/campus_virtual.svg"},
      {"label": "Eventos deportivos", "iconPath": "assets/icons/eventos_deportivos.svg"},
      {"label": "Trámites", "iconPath": "assets/icons/tramites.svg"},
      {"label": "Pagos", "iconPath": "assets/icons/pagos.svg"},
    ];

    return OverlayAnimationWrapper(
      onDismiss: onDismiss,
      buttons: buttons,
    );
  }
}
