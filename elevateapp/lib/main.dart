import 'package:elevateapp/core/di/dependency_injection.dart';
import 'package:elevateapp/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setLocator();
  runApp( StoreApp(appRouter: AppRouter(),));
}