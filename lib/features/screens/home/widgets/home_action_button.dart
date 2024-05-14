
import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 15,
                color: Color.fromARGB(255, 211, 209, 209).withOpacity(.8),
              )
            ]),
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 25,
          color: CColors.themeColor,
        ),
      ),
    );
  }
}
