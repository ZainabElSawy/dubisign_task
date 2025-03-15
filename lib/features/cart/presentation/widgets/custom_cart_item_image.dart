import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartItemImage extends StatelessWidget {
  const CustomCartItemImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 82.w,
      height: 82.h,
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: 82.w,
        height: 82.h,
        decoration: ShapeDecoration(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Center(child: CupertinoActivityIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        width: 82.w,
        height: 82.h,
        decoration: ShapeDecoration(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Icon(Icons.error),
      ),
    );
  }
}
