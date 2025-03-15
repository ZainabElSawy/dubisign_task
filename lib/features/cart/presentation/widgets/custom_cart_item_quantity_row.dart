import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/style.dart';

class CustomCartItemQuantityRow extends StatefulWidget {
  const CustomCartItemQuantityRow({super.key, required this.quantity});
  final int quantity;
  @override
  State<CustomCartItemQuantityRow> createState() =>
      _CustomCartItemQuantityRowState();
}

class _CustomCartItemQuantityRowState extends State<CustomCartItemQuantityRow> {
  @override
  void initState() {
    count = widget.quantity;
    super.initState();
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40.r),
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: Container(
            width: 24.r,
            height: 24.r,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(0xFF4E5562),
                ),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                size: 17.sp,
                color: Color(0xFF4E5562),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          '$count',
          textAlign: TextAlign.right,
          style: Styles.textStyle12.copyWith(color: Colors.black),
        ),
        SizedBox(width: 16.w),
        InkWell(
          borderRadius: BorderRadius.circular(40.r),
          onTap: () {
            setState(() {
              count--;
            });
          },
          child: Container(
            width: 24.r,
            height: 24.r,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(0xFF4E5562),
                ),
              ),
            ),
            child: Icon(
              Icons.remove,
              size: 17.sp,
              color: Color(0xFF4E5562),
            ),
          ),
        ),
      ],
    );
  }
}
