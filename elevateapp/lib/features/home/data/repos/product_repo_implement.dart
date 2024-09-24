import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevateapp/core/error/failure.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import 'product_repo.dart';

class ProductRepoImplement implements ProductRepo {
 final ProductService productService ;
  List<ProductModel> products = [];

  ProductRepoImplement({required this.productService});
  @override
  Future<Either<ServerFailure, List<ProductModel>>> fetchProducts() async {
    try {
      var data = await productService.getProducts();
      for (var product in data) {
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
