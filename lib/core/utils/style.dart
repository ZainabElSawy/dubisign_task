import 'package:dubisign/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static late TextStyle textStyle10;
  static late TextStyle textStyle12;
  static late TextStyle textStyle14;
  static late TextStyle textStyle16;
  static late TextStyle textStyle18;
  static late TextStyle textStyle20;
  static late TextStyle textStyle24;
  static late TextStyle textStyle30;
  static void init() {
    textStyle10 = TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Poppins',
      color: AppColors.greyColor,
      fontWeight: FontWeight.w400,
    );
    textStyle12 = TextStyle(
      fontSize: 12.sp,
      color: AppColors.primaryColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
    textStyle14 = TextStyle(
      fontSize: 14.sp,
      color: AppColors.primaryColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    textStyle16 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
      fontFamily: 'Poppins',
    );
    textStyle18 = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
    textStyle20 = TextStyle(
      fontSize: 20.sp,
      color: AppColors.primaryColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.50.h,
    );
    textStyle24 = TextStyle(
      color: Color(0xFF061023),
      fontSize: 24.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
    textStyle30 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      // fontFamily: kGtSectraFine,
    );
  }
}
