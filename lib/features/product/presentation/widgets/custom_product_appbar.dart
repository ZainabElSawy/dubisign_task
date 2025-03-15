import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomProductAppBar extends StatelessWidget {
  const CustomProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          children: [
            InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Icon(
                CupertinoIcons.back,
                color: AppColors.backgroundColor,
                size: 24.sp,
              ),
            ),
            Spacer(),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 204),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(49.r),
                ),
              ),
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                ImageAssets.heart,
                // ignore: deprecated_member_use
                color: AppColors.primaryColor,
                width: 24.sp,
                height: 24.sp,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 204),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(49.r),
                ),
              ),
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                ImageAssets.bag,
                // ignore: deprecated_member_use
                color: AppColors.primaryColor,
                width: 24.sp,
                height: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
