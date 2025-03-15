import 'package:dubisign/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/style.dart';
import '../../domain/entities/cart_with_products.dart';
import 'custom_cart_item_image.dart';
import 'custom_cart_item_quantity_row.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.product,
    this.onRemove,
  });
  final ProductWithQuantity product;
  final void Function()? onRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.w),
      padding: EdgeInsets.all(15.w),
      decoration: ShapeDecoration(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x7FE5EAF4),
            blurRadius: 15.r,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCartItemImage(image: product.product.image ?? ""),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2.w,
                  children: [
                    Expanded(
                      child: Text(
                        product.product.title ?? "",
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'L',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle14.copyWith(
                        color: Color(0xFF4E5562),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$${product.product.price}',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCartItemQuantityRow(quantity: product.quantity),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(40.r),
                      onTap: onRemove,
                      child: SvgPicture.asset(
                        ImageAssets.trash,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
