import 'package:flutter/material.dart';
import 'package:mechinetest/commen/layout/grid_layout.dart';
import 'package:mechinetest/commen/shimmer/shimmer_effect.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CProductShimmer extends StatelessWidget {
  const CProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 200,
      itemBuilder: (_, __) => SizedBox(
        width: CHelperFuntions.screenWidth() * .35,
        height: CHelperFuntions.screenHeight() * .1,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            CShimmerEffect(width: 180, height: 180),
            SizedBox(height: CSizes.spaceBtwItem),

            // Text
            // CShimmerEffect(width: 160, height: 15),
            // SizedBox(height: CSizes.spaceBtwItem / 2),
            // CShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
