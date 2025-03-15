import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

BottomNavigationBarItem buildNavItem(String assetPath) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.only(top: 13.h),
      child: SvgPicture.asset(
        assetPath,
        width: 24.w,
        height: 24.h,
        colorFilter: ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    label: '',
  );
}
