import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import 'custom_images_builder.dart';
import 'custom_swipe_column.dart';

class CustomProductImagesWithSwipeWidgets extends StatefulWidget {
  const CustomProductImagesWithSwipeWidgets({
    super.key,
    required this.showArrow,
    required this.productModel,
  });

  final bool showArrow;
  final ProductModel productModel;

  @override
  State<CustomProductImagesWithSwipeWidgets> createState() =>
      _CustomProductImagesWithSwipeWidgetsState();
}

class _CustomProductImagesWithSwipeWidgetsState
    extends State<CustomProductImagesWithSwipeWidgets>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late AnimationController _arrowController;
  late List<Animation<double>> _fadeAnimations;
  @override
  void dispose() {
    _arrowController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: false);

    _fadeAnimations = List.generate(3, (index) {
      return Tween<double>(
        begin: 1.0 - (index * 0.3),
        end: 0.0,
      ).animate(CurvedAnimation(
        parent: _arrowController,
        curve: Interval(index * 0.3, 1.0, curve: Curves.easeOut),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: SizedBox.shrink(),
      backgroundColor: AppColors.backgroundColor,
      expandedHeight: 680.h,
      floating: false,
      pinned: true,
      collapsedHeight: 200.h,
      flexibleSpace: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImagesBuilder(
            pageController: _pageController,
            productModel: widget.productModel,
          ),
          CustomSwipeColumn(
            showArrow: widget.showArrow,
            fadeAnimations: _fadeAnimations,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
