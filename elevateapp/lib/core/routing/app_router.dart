import 'package:elevateapp/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../features/home/views/screens/home_page.dart';
import '../../features/splash/views/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
          
        });

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      default:
        return null;
    }
  }
}
