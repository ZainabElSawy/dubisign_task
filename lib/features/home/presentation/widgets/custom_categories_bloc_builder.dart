import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/all_categories_cubit/all_categories_cubit.dart';
import 'custom_list_of_categories.dart';
import 'custom_list_of_loading_categories.dart';

class CustomCategoriesBlocBuilder extends StatelessWidget {
  const CustomCategoriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        if (state is AllCategoriesSuccess) {
          return CustomListOfCategories(categories: state.categories);
        } else if (state is AllCategoriesLoading) {
          return CustomListOfLoadingCategories();
        } else if (state is AllCategoriesNetworkFailure) {
          return SizedBox(
            height: 50.h,
            child: Center(
              child: Icon(Icons.wifi_off),
            ),
          );
        } else {
          return SizedBox(
            height: 50.h,
            child: Center(
              child: Icon(Icons.error),
            ),
          );
        }
      },
    );
  }
}
