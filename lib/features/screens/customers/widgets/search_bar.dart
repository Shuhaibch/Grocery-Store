import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/device/device_util.dart';

class CCustomerSearchContainer extends StatelessWidget {
  const CCustomerSearchContainer({
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.qr_code,
                    color: CColors.darkerGreyColor,
                  ),
                  SizedBox(
                    width: CSizes.spaceBtwItem,
                  ),
                  CCircularContainer(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
