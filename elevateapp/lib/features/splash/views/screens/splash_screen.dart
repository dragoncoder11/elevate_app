import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/animated_splash_image.dart';
import '../widgets/animated_splash_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> _textFadeAnimation;
  late AnimationController _textFadeAnimationController;
  late Animation<double> _imageFadeAnimation;
  late AnimationController _imageFadeAnimationController;
  double textTop = 280.h;

  void firstFade() {
    _textFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_textFadeAnimationController);

    _textFadeAnimationController.forward().whenComplete(() {
      setState(() {
        textTop = 700.h;
      });

      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.of(context)
            .pushReplacementNamed(Routes.homeRoute);
      });
    });
  }

  void secondFade() {
    _imageFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    _imageFadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_imageFadeAnimationController);
    _imageFadeAnimationController.forward();
  }

  @override
  void initState() {
    super.initState();
    firstFade();
    secondFade();
  }

  @override
  void dispose() {
    _textFadeAnimationController.dispose();
    _imageFadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSplashText(textTop: textTop, textFadeAnimation: _textFadeAnimation),
          AnimatedSplashImage(imageFadeAnimation: _imageFadeAnimation),
        ],
      ),
    );
  }
}