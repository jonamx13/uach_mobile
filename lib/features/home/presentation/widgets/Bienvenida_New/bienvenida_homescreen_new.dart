import 'package:flutter/material.dart';

class BienvenidaHomeScreenNew extends StatelessWidget {
  const BienvenidaHomeScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeAreaHeight = mediaQuery.padding.top;

    //Main Container
    return Container(
      width: double.infinity,
      height: (mediaQuery.size.height - safeAreaHeight) / 5,
      child: Stack(
        children: [
          // Fondo (Container con el gradient)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF401E57), // Color Inferior
                    Color(0xFF8B41BD) // Color Superior
                  ],
                ),
              ),
            ),
          ),
          // Contenido de la columna
          Column(
            children: [
              // logo de la app centrado
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 189,
                  height: 44,
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Text(
                    'logo de la app',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
