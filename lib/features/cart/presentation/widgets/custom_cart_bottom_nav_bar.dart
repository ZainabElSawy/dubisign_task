import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';
import 'custom_pricing_section.dart';

class CustomCartBottomNavBar extends StatelessWidget {
  const CustomCartBottomNavBar({
    super.key,
    required this.totalPrice,
  });
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPricingSection(totalPrice: totalPrice),
          SizedBox(height: 18.h),
          InkWell(
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 18.w,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: AppColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Checkout',
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
