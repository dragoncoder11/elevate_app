import 'package:elevateapp/core/dependency_injection/dependency_injection.dart';
import 'package:elevateapp/core/routing/routes.dart';
import 'package:elevateapp/features/home/data/repos/product_repo_implement.dart';
import 'package:elevateapp/features/home/logic/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/views/screens/home_page.dart';
import '../../features/splash/views/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => ProductCubit(locator<ProductRepoImplement>())..fetchProducts(),
            child: const HomePage(),
          );
          
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
