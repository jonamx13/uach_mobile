import 'package:flutter/material.dart';

class AvatarUsuario extends StatelessWidget {
  const AvatarUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      height: 77,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/Santie_05.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
