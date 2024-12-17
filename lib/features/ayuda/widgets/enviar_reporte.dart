import 'package:flutter/material.dart';

class EnviarReporte extends StatelessWidget {
  final VoidCallback onSend;

  const EnviarReporte({Key? key, required this.onSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onSend,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF401E57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
          ),
          child: Text(
            'ENVIAR',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
