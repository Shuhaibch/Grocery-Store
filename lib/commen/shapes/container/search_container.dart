import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mechinetest/features/controllers/search_controller.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/device/device_util.dart';

class CSearchContainer extends StatelessWidget {
  const CSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
    required this.controller,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final searchController = ProductSearchController.instance;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: CDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(CSizes.md),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  blurRadius: 5,
                  offset: const Offset(-5, 0),
                  spreadRadius: 10),
              BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                  spreadRadius: 10)
            ],
            borderRadius: BorderRadius.circular(30),
            border: showBorder ? Border.all(color: CColors.greyColor) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: CColors.darkerGreyColor,
            ),
            const SizedBox(
              width: CSizes.spaceBtwItem,
            ),
            Expanded(
              child: SizedBox(
                height: 35,
                child: TextFormField(
                  controller: controller,
                  onChanged: (value) => searchController.clearSearch(),
                  onEditingComplete: () => searchController.getSearchProduct(),
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
