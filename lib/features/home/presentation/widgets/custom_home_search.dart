import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';

class CustomHomeSearch extends StatefulWidget {
  const CustomHomeSearch({
    super.key,
  });

  @override
  State<CustomHomeSearch> createState() => _CustomHomeSearchState();
}

class _CustomHomeSearchState extends State<CustomHomeSearch> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    setState(() {});
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            ImageAssets.search,
            width: 24.sp,
            height: 24.sp,
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              scrollPadding: EdgeInsets.zero,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                hintText: "What are you looking for...",
                hintStyle: Styles.textStyle10,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          )
        ],
      ),
    );
  }
}
