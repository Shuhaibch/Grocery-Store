import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
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
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
