import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

import '../../../../core/utils/app_colors.dart';
import 'custom_product_card.dart';

class CustomLoadingProductsGrid extends StatelessWidget {
  const CustomLoadingProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 160 / 285,
      ),
      itemBuilder: (context, index) {
        return LoadingProductCard();
      },
    );
  }
}

class LoadingProductCard extends StatelessWidget {
  const LoadingProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: InvertedBottomHalfCircleClipper(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: Colors.grey[300]!,
                  height: 190.h,
                  width: double.infinity,
                  borderRadius: 15.r,
                  duration: Duration(milliseconds: 500),
                  depth: 10,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -22.5,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: Colors.grey[300]!,
                  height: 40.h,
                  width: 40.w,
                  borderRadius: 20.r,
                  duration: Duration(milliseconds: 500),
                  depth: 10,
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 5.h,
              child: ShimmerPro.sized(
                light: ShimmerProLight.lighter,
                scaffoldBackgroundColor: Colors.grey[200]!,
                height: 30.h,
                width: 30.w,
                borderRadius: 36.75.r,
                depth: 0,
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        ShimmerPro.sized(
          light: ShimmerProLight.lighter,
          scaffoldBackgroundColor: Colors.grey[300]!,
          height: 15.h,
          width: 100.w,
          borderRadius: 10.r,
          duration: Duration(milliseconds: 500),
          depth: 10,
        ),
        ShimmerPro.sized(
          light: ShimmerProLight.lighter,
          scaffoldBackgroundColor: Colors.grey[300]!,
          height: 15.h,
          width: 70.w,
          borderRadius: 10.r,
          duration: Duration(milliseconds: 500),
          depth: 10,
        ),
      ],
    );
  }
}
