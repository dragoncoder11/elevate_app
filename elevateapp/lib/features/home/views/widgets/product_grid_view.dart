import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../logic/product_cubit/product_cubit.dart';
import 'product_card.dart';
import 'skele_product.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is FailedToGetProductState) {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  child: Text(state.errMessage),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Skeletonizer(
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 240.h),
                itemBuilder: (context, index) {
                  return const SkeleProduct();
                }),
          );
        }
        if (state is ProductSuccessState) {
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 245.h),
              itemBuilder: (context, index) {
                return ProductCard(productModel: state.products[index],);
              });
        }else{
        return const SizedBox.shrink();

        }
      },
    );
  }
}