import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';

class CCurvedContainer extends StatelessWidget {
  const CCurvedContainer({
    super.key,
    this.width,
    this.height,
    this.x = CSizes.cardRadiusLg,
    this.y = CSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = CColors.borderPrimaryColor,
    this.backgroundColor = CColors.whiteColor,
    this.padding,
    this.margin,
    this.boxshadow,
  });
  final double? width, height;
  final double x,y;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final List<BoxShadow>? boxshadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.elliptical(x, y)),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
