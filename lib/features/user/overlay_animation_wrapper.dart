import 'package:flutter/material.dart';
import 'overlay_button.dart';

class OverlayAnimationWrapper extends StatefulWidget {
  final VoidCallback onDismiss;
  final List<Map<String, String>> buttons;

  const OverlayAnimationWrapper({
    Key? key,
    required this.onDismiss,
    required this.buttons,
  }) : super(key: key);

  @override
  State<OverlayAnimationWrapper> createState() => _OverlayAnimationWrapperState();
}

class _OverlayAnimationWrapperState extends State<OverlayAnimationWrapper> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = _createAnimation(begin: 0, end: 1);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 3), // Fuera de la pantalla
      end: Offset.zero,
    ).animate(_animationCurve());

    _controller.forward();
  }

  Animation<double> _createAnimation({required double begin, required double end}) {
    return Tween<double>(begin: begin, end: end).animate(_animationCurve());
  }

  CurvedAnimation _animationCurve() {
    return CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismissOverlay() {
    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: GestureDetector(
            onTap: _dismissOverlay,
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _buildButtons(),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildButtons() {
    return widget.buttons
        .map((button) => SlideTransition(
              position: _slideAnimation,
              child: OverlayButton(
                label: button["label"]!,
                iconPath: button["iconPath"]!,
                onPressed: () {}, // Aquí puedes definir cada acción
              ),
            ))
        .toList();
  }
}
