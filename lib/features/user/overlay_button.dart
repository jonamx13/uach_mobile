import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverlayButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String iconPath;

  const OverlayButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD8E2FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFF362B3E),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF401E57),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
