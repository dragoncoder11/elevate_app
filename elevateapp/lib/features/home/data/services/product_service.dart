import 'package:dio/dio.dart';
import 'package:elevateapp/core/error/failure.dart';
import '../../../../core/helper/app_constants.dart';

class ProductService {
  final Dio dio;

  ProductService({required this.dio});

  getProducts() async {
    try {
      var response = await dio.get(AppConstants.baseUrl);
      var responseBody = response.data;
      return responseBody;
    } on DioException catch (e) {
      return ServerFailure.fromDioError(e);
    }
  }
}
