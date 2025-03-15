import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/style.dart';

class CustomProductViewBody extends StatelessWidget {
  const CustomProductViewBody({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sub total',
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '\$${productModel.price}',
                style: Styles.textStyle24,
              ),
            ],
          ),
          Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kCartView);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Continue',
                    style: Styles.textStyle14.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    CupertinoIcons.arrow_right,
                    color: AppColors.backgroundColor,
                    size: 18.sp,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
