import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/screens/cart/pages/cart_screen.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () => Get.to(() => CartScreen()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 15,
                      color: const Color.fromARGB(255, 211, 209, 209)
                          .withOpacity(.8),
                    )
                  ]),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: CColors.themeColor,
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              child: CCircularContainer(
                backgroundColor: CColors.secondaryColor.withOpacity(.5),
                height: 19,
                width: 15,
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.noOfCartItems.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
