import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';

class CustomSwipeColumn extends StatelessWidget {
  const CustomSwipeColumn({
    super.key,
    required bool showArrow,
    required List<Animation<double>> fadeAnimations,
    required PageController pageController,
  })  : _showArrow = showArrow,
        _fadeAnimations = fadeAnimations,
        _pageController = pageController;

  final bool _showArrow;
  final List<Animation<double>> _fadeAnimations;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16.h,
      child: Column(
        children: [
          if (_showArrow)
            Column(
              children: [
                AnimatedOpacity(
                  opacity: _showArrow ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 1500),
                  child: Stack(
                    children: List.generate(3, (index) {
                      return FadeTransition(
                        opacity: _fadeAnimations[index],
                        child: Padding(
                          padding: EdgeInsets.only(top: index * 9.w),
                          child: Icon(
                            CupertinoIcons.chevron_up,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Swipe up for details',
                  style: Styles.textStyle14
                      .copyWith(color: AppColors.backgroundColor),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              1,
              (index) => Container(
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      color: (_pageController.page ?? 0.0).round() == index
                          ? AppColors.backgroundColor
                          : Colors.transparent,
                      width: 1.r,
                    ),
                  ),
                  color: Colors.transparent,
                ),
                child: Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(),
                    color: (_pageController.page ?? 0.0).round() == index
                        ? AppColors.backgroundColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
