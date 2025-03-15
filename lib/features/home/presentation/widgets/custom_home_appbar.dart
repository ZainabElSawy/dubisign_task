import 'package:dubisign/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets.dart';
import '../../../../core/utils/style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Styles.textStyle10,
            ),
            Text(
              userName,
              style: Styles.textStyle12,
            ),
          ],
        ),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () => GoRouter.of(context).push(AppRouter.kCartView),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x7FE5EAF4),
                  blurRadius: 15,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: SvgPicture.asset(
              ImageAssets.bag,
              width: 24.sp,
              height: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
