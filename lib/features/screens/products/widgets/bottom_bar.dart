import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/navigation_menu.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';
import 'package:mechinetest/utils/loader/loader.dart';

import '../../../../commen/shapes/container/curved_container.dart';
import '../../../../commen/shapes/container/rounded_container.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.cartController,
    this.bottomHeight=80,
  });

  final CartController cartController;
  final double bottomHeight;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Positioned(
      bottom: bottomHeight,
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
                              Obx(
                                () {
                                  return Text(
                                    '\$${cartController.totalCartPrice.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontSize: 27,
                                            fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (cartController.noOfCartItems.value > 0) {
                              controller.selectedIndex.value = 2;
                            } else {
                              CLoaders.errorSnackBar(
                                  title: 'Your Cart Is Empty');
                            }
                          },
                          child: CRoundedContainer(
                            isGradient: true,
                            padding: const EdgeInsets.symmetric(
                                vertical: CSizes.sm + 5, horizontal: CSizes.lg),
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
    );
  }
}
