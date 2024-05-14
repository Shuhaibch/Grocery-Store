import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = CSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = CColors.borderPrimaryColor,
      this.backgroundColor = CColors.whiteColor,
      this.padding,
      this.margin,
      this.boxshadow,
      this.isGradient = false});
  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final List<BoxShadow>? boxshadow;
  final bool isGradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 1, 99, 6),
                  Color.fromARGB(199, 9, 139, 37),
                  Color.fromARGB(255, 1, 99, 6),
                ],
              )
            : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
