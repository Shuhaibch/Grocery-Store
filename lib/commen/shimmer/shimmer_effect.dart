
import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class CShimmerEffect extends StatelessWidget {
  const CShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor:  Colors.grey[300]!,
      highlightColor:  Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color:
                color ?? ( CColors.whiteColor),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}