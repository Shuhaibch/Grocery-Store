
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({
    super.key,
    required this.cartController,
    required this.product,
  });

  final CartController cartController;
  final CartItemModel product;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final productQuantityInCart =
            cartController.getProductQuantityinCart(product.productId);
        return Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: productQuantityInCart > 0
                    ? Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: InkWell(
                              onTap: () {
                                cartController.removeOneFromCart(product);
                              },
                              child: CCircularContainer(
                                height: 28,
                                radius: 28,
                                width: 28,
                                backgroundColor: Colors.transparent,
                                isGradient: true,
                                boxborder: Border.all(
                                  color: const Color.fromARGB(255, 14, 111, 18),
                                  width: 2,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color.fromARGB(255, 14, 111, 18),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              productQuantityInCart.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                          )
                        ],
                      )
                    : const SizedBox()),

            //* ADD Button
            InkWell(
              onTap: () {
                if (productQuantityInCart > 0) {
                  // final cartItem = cartController
                  //     .convertToCartItem(product, 1);
                  cartController.addOneToCart(product);
                } else {
                  // cartController.productQuantityInCart.value =
                  //     1;
                  // cartController.addToCart(product);
                }
              },
              child: const CCircularContainer(
                height: 28,
                radius: 28,
                width: 28,
                backgroundColor: Color.fromARGB(255, 16, 142, 20),
                isGradient: true,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
