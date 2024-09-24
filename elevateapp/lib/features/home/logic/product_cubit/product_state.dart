part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoadingState extends ProductState {}
final class ProductSuccessState extends ProductState {
  final List<ProductModel>products;

  ProductSuccessState({required this.products});
}
final class FailedToGetProductState extends ProductState {
  final String errMessage;

  FailedToGetProductState({required this.errMessage});
}

