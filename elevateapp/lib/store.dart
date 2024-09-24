import 'package:elevateapp/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/routes.dart';
class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.appRouter,});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Locked App',
          initialRoute: Routes.splashRoute,
          onGenerateRoute: appRouter.generateRoute,
        
        );
      },
    );
  }
}
