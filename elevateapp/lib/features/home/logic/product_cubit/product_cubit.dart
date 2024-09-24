import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elevateapp/core/failure/failure.dart';
import 'package:elevateapp/features/home/data/repos/product_repo_implement.dart';
import 'package:meta/meta.dart';
import '../../data/models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepoImpl) : super(ProductInitial());
  
 final ProductRepoImplement productRepoImpl ;

  fetchProducts() async {
    emit(ProductLoadingState());
    try {
      var result = await productRepoImpl.fetchProducts();
      result.fold(
          (failure) =>
              emit(FailedToGetProductState(errMessage: failure.errMessage)),
          (products) => emit(ProductSuccessState(products: products)));
    } on DioError catch (e) {
      emit(FailedToGetProductState(
          errMessage: ServerFailure.fromDioError(e).errMessage));
    }
  }
}
