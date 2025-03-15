import 'package:dubisign/features/home/presentation/manager/all_categories_cubit/all_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/all_products_cubit/all_products_cubit.dart';
import '../widgets/custom_categories_bloc_builder.dart';
import '../widgets/custom_home_appbar.dart';
import '../widgets/custom_home_banner.dart';
import '../widgets/custom_home_search.dart';
import '../widgets/custom_products_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    BlocProvider.of<AllProductsCubit>(context).fetchProducts();
    // ignore: use_build_context_synchronously
    BlocProvider.of<AllCategoriesCubit>(context).fetchCategories();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(seconds: 2));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        header: MaterialClassicHeader(
          color: AppColors.primaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    CustomHomeAppBar(userName: 'Falcon Thought'),
                    SizedBox(height: 20.h),
                    CustomHomeSearch(),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    CustomHomeBanner(),
                    SizedBox(height: 7.h),
                    CustomCategoriesBlocBuilder(),
                    CustomProductsGrid(),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
