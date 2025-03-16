import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class CustomListOfLoadingCategories extends StatelessWidget {
  const CustomListOfLoadingCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => ShimmerPro.sized(
          light: ShimmerProLight.lighter,
          scaffoldBackgroundColor: Colors.grey[400]!,
          height: 40.h,
          width: 90.w,
          borderRadius: 26.r,
          duration: Duration(milliseconds: 500),
          depth: 7,
        ),
      ),
    );
  }
}
