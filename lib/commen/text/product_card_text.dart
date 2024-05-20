import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/commen/text/favorite_icon.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
    required this.product,
    required this.isHome,
  });
  final ProductList product;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    // final homeController = HomeController.instance;

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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                    width: 160,
                    child: Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade),
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
            isHome
                ? CFavoriteIcon(
                    productId: product.id,
                  )
                :

                //* Add Icon
                Obx(
                    () {
                      final productQuantityInCart =
                          cartController.getProductQuantityinCart(product.id);
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
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: InkWell(
                                            onTap: () {
                                              final cartItem = cartController
                                                  .convertToCartItem(
                                                      product, 1);
                                              cartController
                                                  .removeOneFromCart(cartItem);
                                            },
                                            child: CCircularContainer(
                                              height: 28,
                                              radius: 28,
                                              width: 28,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isGradient: true,
                                              boxborder: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 14, 111, 18),
                                                width: 2,
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 14, 111, 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          productQuantityInCart.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                        )
                                      ],
                                    )
                                  : const SizedBox()),

                          //* ADD Button
                          InkWell(
                            onTap: () {
                              if (productQuantityInCart > 0) {
                                final cartItem = cartController
                                    .convertToCartItem(product, 1);
                                cartController.addOneToCart(cartItem);
                              } else {
                                cartController.productQuantityInCart.value = 1;
                                cartController.addToCart(product);
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
                  )
          ],
        ),
      ),
    );
  }
}
