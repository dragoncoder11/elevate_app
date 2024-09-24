import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSplashImage extends StatelessWidget {
  const AnimatedSplashImage({
    super.key,
    required Animation<double> imageFadeAnimation,
  }) : _imageFadeAnimation = imageFadeAnimation;

  final Animation<double> _imageFadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300.h,
      child: FadeTransition(
        opacity: _imageFadeAnimation,
        child: Image.asset('assets/storelogo.png',
            width: 300.w, height: 300.h),
      ),
    );
  }
}
