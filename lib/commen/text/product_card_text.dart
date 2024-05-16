import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
    required this.product,
  });
  final ProductList product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              //  Obx(
              //   () {
              //     // final productQunatityInCart =
              //     //     cartController.getProductQuantityinCart(product.id);
              //     return
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: '/kg',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //* Add Icon

              // final cartItem = cartController.convertToCartItem(product, 1);
              // int index = 0;
              // if (cartController.cartItem.contains(cartItem)) {
              //   index = cartController.cartItem.indexWhere((cartItems) =>
              //       cartItems.productId == cartItem.productId);
              //   // RxInt quantity = cartController.cartItem[index].quantity;
              // }
              // final item = cartController.cartItem[index];
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: InkWell(
                            onTap: () {
                              final cartItem =
                                  cartController.convertToCartItem(product, 1);
                              cartController.removeOneFromCart(cartItem);
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
                        Obx(() {
                          // final cartItem =
                          //     cartController.convertToCartItem(product, 1);
                          // int index = cartController.cartItem.indexWhere(
                          //     (cartItems) =>
                          //         cartItems.productId == cartItem.productId);
                          // final CartItemModel? item =
                          //     cartController.cartItem[index];
                          final RxInt quantity =
                              cartController.getProductCartQuantity(product);

                          return Text(
                            quantity.value.toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                          );
                        })
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      final cartItem =
                          cartController.convertToCartItem(product, 1);
                      cartController.addOneToCart(cartItem);
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
              )
            ],
          )
          //   },
          // ),
          ),
    );
  }
}
