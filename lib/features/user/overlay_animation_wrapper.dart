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
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      ),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _dismissOverlay() {
    _fadeController.reverse();
    _slideController.reverse().then((_) {
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
                children: widget.buttons
                    .map((button) => SlideTransition(
                          position: _slideAnimation,
                          child: OverlayButton(
                            label: button["label"]!,
                            iconPath: button["iconPath"]!,
                            onPressed: () {},
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
