import 'package:flutter/material.dart';

class AnimatedSplashText extends StatelessWidget {
  const AnimatedSplashText({
    super.key,
    required this.textTop,
    required Animation<double> textFadeAnimation,
  }) : _textFadeAnimation = textFadeAnimation;

  final double textTop;
  final Animation<double> _textFadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      top: textTop,
      child: FadeTransition(
        opacity: _textFadeAnimation,
        child: const Text(
          'Welcome!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


