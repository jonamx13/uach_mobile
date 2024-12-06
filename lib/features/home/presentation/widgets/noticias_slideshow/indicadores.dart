import 'package:flutter/material.dart';

class Indicadores extends StatelessWidget {
  final int total;
  final int actual;

  const Indicadores({
    Key? key,
    required this.total,
    required this.actual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: actual == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}
