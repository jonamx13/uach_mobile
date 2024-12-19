import 'package:flutter/material.dart';

class AgenteAI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenemos el alto de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculamos el alto proporcional (13.1% de la altura de la pantalla)
    double widgetHeight = screenHeight * 0.131;

    return Container(
      width: double.infinity, // Asegura que ocupe todo el ancho
      height: widgetHeight, // Establecemos el alto calculado
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Espaciado dentro del contenedor
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Alineación de los elementos
        children: [
          // Contenedor con la columna que agrupa los textos
          Container(
            width: MediaQuery.of(context).size.width * 0.55, // 4/6 del ancho disponible
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa los textos
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto: "Utiliza nuestro agente..."
                Text(
                  'Utiliza nuestro agente de Inteligencia Artificial para resolver tus dudas.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12, // Tamaño del texto ajustado
                    color: Color(0xFF362B3E),
                  ),
                  overflow: TextOverflow.visible, // Permite que el texto no se recorte
                  softWrap: true, // Permite que el texto se envuelva cuando llegue al límite
                ),
                // Texto: "Iniciar Chat" alineado a la esquina inferior derecha
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Iniciar Chat',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: Color(0xFF401E57),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Divider en el medio que ocupa todo el alto disponible
          Container(
            height: widgetHeight, // Establecemos el alto igual al del widget
            child: VerticalDivider(
              color: Color(0xFFD8E2FF),
              thickness: 1,
              width: 20,
            ),
          ),
          // Icono a la derecha, centrado en el espacio restante
          Center(
            child: Icon(
              Icons.comment_rounded, // Ícono de globo de texto
              color: Color(0xFF362B3E), // Color del ícono
              size: 24, // Tamaño del ícono
            ),
          ),
        ],
      ),
    );
  }
}
