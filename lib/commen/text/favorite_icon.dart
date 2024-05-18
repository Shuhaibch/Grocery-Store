import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mechinetest/commen/icon/circular_icon.dart';
import 'package:mechinetest/features/controllers/favorite_controller.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class CFavoriteIcon extends StatelessWidget {
  const CFavoriteIcon({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(
      () => CCircularIcon(
        icon: controller.isFavorite(productId.toString())
            ? Iconsax.heart5
            : Iconsax.heart,
        color: controller.isFavorite(productId.toString())
            ? CColors.errorColor
            : null,
        onPressed: () => controller.toggleFavoriteProduct(productId.toString()),
      ),
    );
  }
}
