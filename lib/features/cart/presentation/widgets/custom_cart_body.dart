import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/cart_with_products.dart';
import 'custom_cart_bottom_nav_bar.dart';
import 'custom_cart_item.dart';

class CustomCartBody extends StatefulWidget {
  const CustomCartBody({
    super.key,
    required this.cartWithProducts,
  });
  final CartWithProducts cartWithProducts;

  @override
  State<CustomCartBody> createState() => _CustomCartBodyState();
}

class _CustomCartBodyState extends State<CustomCartBody> {
  late List<ProductWithQuantity> _products;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _products = List.from(widget.cartWithProducts.products);
  }

  void _removeItem(int index) {
    final removedProduct = _products[index];
    _products.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedProduct, animation),
    );
  }

  Widget _buildRemovedItem(
      ProductWithQuantity product, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.0, 0.0),
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      )),
      child: CustomCartItem(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomCartBottomNavBar(
        totalPrice: widget.cartWithProducts.totalPrice,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _products.length,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              )),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: CustomCartItem(
                  product: _products[index],
                  onRemove: () => _removeItem(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
