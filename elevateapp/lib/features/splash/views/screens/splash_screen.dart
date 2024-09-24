import 'package:elevateapp/core/theming/app_colors.dart';
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

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _textFadeAnimation;
  late AnimationController _textFadeAnimationController;
  late Animation<double> _imageFadeAnimation;
  late AnimationController _imageFadeAnimationController;
  double textTop = 280.h;

  void firstFade() {
    _textFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textFadeAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _textFadeAnimationController.forward().whenComplete(() {
      setState(() {
        textTop = 700.h;
      });
       _imageFadeAnimationController.forward().whenComplete(() {
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    });
    });
  }

  void secondFade() {
    _imageFadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1750));
    _imageFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageFadeAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    secondFade();
    firstFade();
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
      backgroundColor: AppColors.mainWhite,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSplashImage(imageFadeAnimation: _imageFadeAnimation),
           AnimatedSplashText(
              textTop: textTop, textFadeAnimation: _textFadeAnimation),
        ],
      ),
    );
  }
}
