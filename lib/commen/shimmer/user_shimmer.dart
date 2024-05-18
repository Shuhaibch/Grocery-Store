import 'package:flutter/material.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/commen/shimmer/shimmer_effect.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CUserShimmer extends StatelessWidget {
  const CUserShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => CRoundedContainer(
        height: CHelperFuntions.screenHeight() * .1,
        child: Row(
          children: [
            CRoundedContainer(
            // backgroundColor: Colors.amber,
            padding: const EdgeInsets.all(10),
            height: CHelperFuntions.screenHeight() * .09,
            width: CHelperFuntions.screenWidth() * .2,
           child:  CShimmerEffect(width: CHelperFuntions.screenWidth() * .2, height: CHelperFuntions.screenHeight() * .09),
          ),
          ],
        ),
      ),
    );
  }
}
