import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_pricing_row.dart';
import 'dashed_divider.dart';

class CustomPricingSection extends StatelessWidget {
  const CustomPricingSection({
    super.key,
    required this.totalPrice,
  });
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPricingRow(
          title: 'Sub total',
          price: totalPrice.toString(),
        ),
        SizedBox(height: 16.h),
        CustomPricingRow(
          title: 'Shipping',
          price: '5.00',
        ),
        DashedDivider(),
        CustomPricingRow(
          title: 'Total',
          price: (totalPrice + 5).toString(),
        ),
      ],
    );
  }
}
