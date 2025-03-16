import 'package:cached_network_image/cached_network_image.dart';
import 'package:dubisign/core/utils/app_colors.dart';
import 'package:dubisign/core/utils/app_router.dart';
import 'package:dubisign/core/utils/style.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel? productModel;
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
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kProductView,
                        extra: productModel?.id ?? 0);
                  },
                  child: Hero(
                    tag: "Product",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        imageUrl: productModel?.image ?? '',
                        placeholder: (context, url) => SizedBox(
                          width: double.infinity,
                          child: const CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 190.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -22.5,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () => GoRouter.of(context).push(AppRouter.kCartView),
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 25.r,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      // ignore: deprecated_member_use
                      color: AppColors.backgroundColor,
                      ImageAssets.bag,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 5.h,
              child: Container(
                width: 30.w,
                height: 30.h,
                padding: EdgeInsets.all(5.w),
                decoration: ShapeDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.75),
                  ),
                ),
                child: SvgPicture.asset(
                  ImageAssets.heart,
                  width: 18.w,
                  height: 18.h,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 28.h),
        Text(
          productModel?.title ?? "",
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 2.h),
        Text(
          '\$${productModel?.price}',
          textAlign: TextAlign.center,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class InvertedBottomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, height);
    path.lineTo((width / 2) - 50, height);
    path.quadraticBezierTo(
        (width / 2) - 40, height, (width / 2) - 27, height - 20);
    // path.quadraticBezierTo(
    //     width / 2, height - 60, (width / 2) + 40, height - 20);
    path.lineTo((width / 2) + 27, height - 20);
    path.quadraticBezierTo((width / 2) + 40, height, (width / 2) + 60, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
