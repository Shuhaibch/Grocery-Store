import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mechinetest/commen/layout/grid_layout.dart';
import 'package:mechinetest/commen/shapes/container/curved_container.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/commen/widget/product/product_card.dart';
import 'package:mechinetest/features/screens/home/widgets/home_action_button.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CGridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) => const ProductCard(),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: CCurvedContainer(
                    backgroundColor: CColors.secondaryColor.withOpacity(.5),
                    x: 20,
                    y: 25,
                    width: CHelperFuntions.screenWidth() * .88,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: CRoundedContainer(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            //* inner row
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Subtotal',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '\$45',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                fontSize: 27,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                CRoundedContainer(
                                  isGradient: true,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: CSizes.sm + 5,
                                      horizontal: CSizes.lg),
                                  backgroundColor: CColors.accentColor,
                                  child: Text(
                                    'CHECKOUT NOW',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
