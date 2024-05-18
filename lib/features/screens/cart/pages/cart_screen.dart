import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/screens/cart/widgets/bottom_sheet.dart';
import 'package:mechinetest/features/screens/cart/widgets/cart_product_list.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: CAppbar(
        showBackArrow: true,
        title: Text('My Cart',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: const Color.fromARGB(255, 5, 70, 9))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        //* blank  space
        child: Stack(
          children: [
            Obx(
              () {
                if (cartController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: CColors.themeColor,
                    ),
                  );
                }
                if (cartController.cartItem.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          // width: CHelperFuntions.screenWidth() * .2,
                          height: CHelperFuntions.screenHeight() * .1,
                          CIMages.iconCart,
                          fit: BoxFit.cover,
                        ),
                        Text('OOPS! Cart is Empty,',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 5, 70, 9))),
                        Text("Let's,Fill it up",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: CColors.accentColor)),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: cartController.cartItem.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = cartController.cartItem[index];

                    return CartProductListTile(
                        cartController: cartController, product: product);
                  },
                );
              },
            ),
            CartBottomBar(
              cartController: cartController,
              bottomHeight: 10,
            )
          ],
        ),
      ),
    );
  }
}
