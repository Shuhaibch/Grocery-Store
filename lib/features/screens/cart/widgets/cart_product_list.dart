import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';
import 'package:mechinetest/features/screens/cart/widgets/add_remoce_button.dart';
import 'package:mechinetest/features/screens/cart/widgets/cart_item_text.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CartProductListTile extends StatelessWidget {
  const CartProductListTile({
    super.key,
    required this.cartController,
    required this.product,
  });

  final CartController cartController;
  final CartItemModel product;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      width: CHelperFuntions.screenWidth() * .9,
      height: CHelperFuntions.screenHeight() * .09,
      backgroundColor: Colors.transparent,
      //* White backgound
      child: Stack(
        clipBehavior: Clip.hardEdge,
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
              width: CHelperFuntions.screenWidth() * .88,
              height: CHelperFuntions.screenHeight() * .08,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: CHelperFuntions.screenWidth() * .2,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CartItemText(
                      product: product,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Flexible(
                      flex: 1,
                      child: AddRemoveButton(
                          cartController: cartController, product: product),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: SizedBox(
                        width: 70,
                        child: Obx(
                          () {
                            final productQuantityInCart = cartController
                                .getProductQuantityinCart(product.productId);
                            return Text(
                              '\$${productQuantityInCart * product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //* image
          Positioned(
            top: 0,
            left: 20,
            child: Image.network(
              width: CHelperFuntions.screenWidth() * .18,
              height: CHelperFuntions.screenHeight() * .07,
              'http://143.198.61.94:8000${product.image}',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
