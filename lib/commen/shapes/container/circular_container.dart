import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.child,
      this.backgroundColor = CColors.whiteColor,
      this.margin,
      this.isGradient = false,
      this.boxborder});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final bool isGradient;
  final BoxBorder? boxborder;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // const Color.fromARGB(255, 14, 111, 18),
                  Colors.white,
                  Color.fromARGB(255, 2, 136, 8),

                  Color.fromARGB(255, 2, 136, 8)
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(radius),
        border: boxborder,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
