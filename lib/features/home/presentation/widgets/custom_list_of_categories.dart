import 'package:dubisign/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';

class CustomListOfCategories extends StatefulWidget {
  const CustomListOfCategories({super.key, required this.categories});
  final List<String> categories;
  @override
  State<CustomListOfCategories> createState() => _CustomListOfCategoriesState();
}

class _CustomListOfCategoriesState extends State<CustomListOfCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length + 1,
            itemBuilder: (context, index) => SizedBox(
              height: 50.h,
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(26.r),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      BlocProvider.of<AllProductsCubit>(context).fetchProducts(
                        cat: index == 0 ? null : widget.categories[index - 1],
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 7.h,
                    ),
                    decoration: ShapeDecoration(
                      shadows: selectedIndex == index
                          ? [
                              BoxShadow(
                                color: Color(0x7FE5EAF4),
                                blurRadius: 15.r,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ]
                          : [],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                      color: selectedIndex == index
                          ? AppColors.backgroundColor
                          : AppColors.lightGreyColor,
                    ),
                    child: Text(
                      index == 0 ? "All" : widget.categories[index - 1],
                      style: Styles.textStyle12
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 8.w),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
