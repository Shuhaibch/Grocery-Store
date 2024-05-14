import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mechinetest/commen/images/c_rounded_images.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CPromoSlider extends StatelessWidget {
  CPromoSlider({
    super.key,
  });
  final List<String> imageList = [
    CIMages.banner,
    CIMages.banner2,
    CIMages.banner3,
    CIMages.banner1,
    CIMages.banner4,
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList
          .map((banner) => Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CRoundedImage(
                  height: 60,
                  borderRadius: 40,
                  applyImageRadius: true,
                  width: CHelperFuntions.screenWidth() * .80,
                  fit: BoxFit.cover,
                  isNetworkImage: false,
                  imageUrl: banner,
                ),
              ))
          .toList(),
      options: CarouselOptions(
        enableInfiniteScroll: false,
        padEnds: false,
        // autoPlay: false,
        autoPlayInterval: const Duration(seconds: 2),
        // enlargeCenterPage: false,
      ),
    );
  }
}
