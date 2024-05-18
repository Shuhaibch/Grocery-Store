import 'package:flutter/material.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/commen/text/product_card_text.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isHome = false,
  });
  final ProductList product;
  final bool isHome;
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
            child: Image.network(
              // width: CHelperFuntions.screenWidth() * .2,
              height: CHelperFuntions.screenHeight() * .11,
              'http://143.198.61.94:8000${product.image}',
              fit: BoxFit.cover,
            ),
          ),
          ProductText(product: product, isHome: isHome)
        ],
      ),
    );
  }
}
