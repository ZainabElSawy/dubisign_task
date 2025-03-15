import 'dart:developer';

import 'package:dubisign/core/utils/app_colors.dart';
import 'package:dubisign/core/utils/style.dart';
import 'package:dubisign/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CupertinoActivityIndicator(radius: 18.r));
          } else if (state is CartSuccess) {
            return CustomCartBody(cartWithProducts: state.cart);
          } else if (state is CartNetworkFailure) {
            return Center(
              child: Icon(Icons.wifi_off),
            );
          } else {
            if (state is CartServerFailure) log(state.errMessage);
            return Center(
              child: Icon(Icons.error),
            );
          }
        },
      ),
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text('Cart', style: Styles.textStyle16),
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppColors.primaryColor,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
