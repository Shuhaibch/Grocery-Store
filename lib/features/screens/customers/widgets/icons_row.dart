import 'package:flutter/material.dart';
import 'package:mechinetest/commen/images/c_circular_images.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CCircularContainer(
          width: 25,
          height: 25,
          backgroundColor: Color.fromARGB(255, 16, 24, 102),
          child: Icon(
            Icons.call,
            size: 15,
            color: Colors.white,
          ),
        ),
        CCircularImage(
          image: CIMages.iconWhatsapp,
          width: 45,
          fit: BoxFit.contain,
          height: 43,
        )
      ],
    );
  }
}
