import 'package:flutter/material.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';

class CartItemText extends StatelessWidget {
  const CartItemText({
    super.key,
    required this.product,
  });
  final CartItemModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\$${product.price}',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                TextSpan(
                  text: '/kg',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
