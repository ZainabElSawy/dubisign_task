import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:dubisign/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_loading_products_grid.dart';
import 'custom_product_card.dart';

class CustomProductsGrid extends StatelessWidget {
  const CustomProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsLoading) {
          return CustomLoadingProductsGrid();
        } else if (state is AllProductsSuccess) {
          List<ProductModel> products = state.products;
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 160 / 255,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                productModel: products[index],
              );
            },
          );
        } else if (state is AllProductsNetworkFailure) {
          return Center(
            child: Icon(Icons.wifi_off),
          );
        } else {
          return Center(
            child: Icon(Icons.error),
          );
        }
      },
    );
  }
}
