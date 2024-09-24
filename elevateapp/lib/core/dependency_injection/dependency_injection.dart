import 'package:dio/dio.dart';
import 'package:elevateapp/features/home/data/repos/product_repo_implement.dart';
import 'package:elevateapp/features/home/data/services/product_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator=GetIt.instance;

Future<void>setLocator()async{
  locator.registerLazySingleton(()=> ProductService(dio: Dio()));
  locator.registerLazySingleton(()=> ProductRepoImplement(productService: locator<ProductService>()));

} 