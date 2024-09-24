import 'package:dartz/dartz.dart';
import 'package:elevateapp/core/error/failure.dart';

import '../models/product_model.dart';

abstract class ProductRepo {
  Future<Either<ServerFailure,List<ProductModel>>> fetchProducts();
}
