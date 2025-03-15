import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImagesBuilder extends StatelessWidget {
  const CustomImagesBuilder({
    super.key,
    required PageController pageController,
    required this.productModel,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.r),
        bottomRight: Radius.circular(32.r),
      ),
      child: Hero(
        tag: "Product",
        child: PageView(
          controller: _pageController,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: ClipRect(
                    child: CachedNetworkImage(
                      imageUrl: productModel.image ?? '',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Original Image
                Center(
                  child: CachedNetworkImage(
                    imageUrl: productModel.image ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 300.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
