import 'dart:developer';

import 'package:dubisign/features/product/presentation/manager/product_cubit/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_product_appbar.dart';
import '../widgets/custom_product_images_with_swipe_widgets.dart';
import '../widgets/custom_product_view_body.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.id});
  final int id;
  @override
  // ignore: library_private_types_in_public_api
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool _showArrow = true;

  void _onScroll(double offset) {
    setState(() {
      _showArrow = offset < 50;
    });
  }

  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).fetchSpecificProduct(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CupertinoActivityIndicator(radius: 18.r));
          } else if (state is ProductSuccess) {
            return Stack(
              children: [
                NotificationListener<ScrollUpdateNotification>(
                  onNotification: (notification) {
                    _onScroll(notification.metrics.pixels);
                    return true;
                  },
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      CustomProductImagesWithSwipeWidgets(
                        showArrow: _showArrow,
                        productModel: state.product,
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverCustomHeaderDelegate(
                          child: CustomProductViewBody(
                            productModel: state.product,
                          ),
                          minHeight: 100.h,
                          maxHeight: 100.h,
                        ),
                      ),
                    ],
                    body: SizedBox.shrink(),
                  ),
                ),
                CustomProductAppBar(),
              ],
            );
          } else if (state is ProductNetworkFailure) {
            return Center(
              child: Icon(Icons.wifi_off),
            );
          } else {
            if (state is ProductServerFailure) log(state.errMessage);
            return Center(
              child: Icon(Icons.error),
            );
          }
        },
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _SliverCustomHeaderDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
