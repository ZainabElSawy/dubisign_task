import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';

class CustomHomeBanner extends StatelessWidget {
  const CustomHomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bannerGreyColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shop wit us!',
                      style: Styles.textStyle14,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Get 40% Off for all iteams",
                      style: Styles.textStyle20,
                    ),
                    SizedBox(height: 14.h),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "Shop Now",
                            style: Styles.textStyle12
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: AppColors.primaryColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Image.asset(
                width: 130.w,
                ImageAssets.banner,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
