import 'package:flutter/material.dart';

import '../../../../core/utils/style.dart';

class CustomPricingRow extends StatelessWidget {
  const CustomPricingRow({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.textStyle14.copyWith(color: Color(0xFF4E5562)),
        ),
        Spacer(),
        Text(
          '\$$price',
          style: Styles.textStyle16.copyWith(fontFamily: 'Inter'),
        )
      ],
    );
  }
}
