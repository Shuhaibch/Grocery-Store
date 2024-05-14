import 'package:flutter/material.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/commen/text/product_card_text.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      width: CHelperFuntions.screenWidth() * .4,
      height: CHelperFuntions.screenHeight() * .1,
      backgroundColor: Colors.transparent,
      //* White backgound
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: CRoundedContainer(
              boxshadow: [
                BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 5,
                  color: Colors.grey.shade200,
                )
              ],
              backgroundColor: Colors.white,
              width: CHelperFuntions.screenWidth() * .42,
              height: CHelperFuntions.screenHeight() * .15,
            ),
          ),

          //* image
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              // width: CHelperFuntions.screenWidth() * .2,
              height: CHelperFuntions.screenHeight() * .11,
              CIMages.catDiary,
              fit: BoxFit.cover,
            ),
          ),
          const ProductText()
        ],
      ),
    );
  }
}
