import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechinetest/commen/layout/grid_layout.dart';
import 'package:mechinetest/commen/shimmer/product_shimmer.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/commen/widget/product/product_card.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/controllers/home_controller.dart';
import 'package:mechinetest/features/screens/home/widgets/home_action_button.dart';
import 'package:mechinetest/features/screens/products/widgets/bottom_bar.dart';
import 'package:mechinetest/utils/constants/sizes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: CAppbar(
        centerTitle: true,
        actions: const [
          HomeActionButton(),
        ],
        title: Text("Products",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: const Color.fromARGB(255, 5, 70, 9))),
      ),
      // bottomNavigationBar:
      body: Padding(
        padding: const EdgeInsets.all(
          CSizes.defaultSpace,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const CProductShimmer();
                      }
                      return controller.localProductList.isEmpty
                          ? CGridLayout(
                              itemCount: controller.productList.length,
                              itemBuilder: (_, index) => ProductCard(
                                product: controller.productList[index],
                              ),
                            )
                          : CGridLayout(
                              itemCount: controller.localProductList.length,
                              itemBuilder: (_, index) => ProductCard(
                                product: controller.localProductList[index],
                              ),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
            BottomBar(cartController: cartController),
          ],
        ),
      ),
    );
  }
}
