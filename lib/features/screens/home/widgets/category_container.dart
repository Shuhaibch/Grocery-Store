import 'package:flutter/material.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/features/models/category/category_image_model.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/constants/sizes.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    super.key,
  });
  final List<CategoryImageModel> category = [
    CategoryImageModel(image: CIMages.catBread, title: "Bread"),
    CategoryImageModel(image: CIMages.catDiary, title: "Dairy"),
    CategoryImageModel(image: CIMages.catFruits, title: "Fruits"),
    CategoryImageModel(image: CIMages.catVeg, title: "Vegetable"),
    CategoryImageModel(image: CIMages.catmeat, title: "Meat"),
    CategoryImageModel(image: CIMages.catspices, title: "Spices"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: category.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        width: CSizes.sm,
      ),
      itemBuilder: (context, index) {
        return CRoundedContainer(
          backgroundColor: Colors.white,
          boxshadow: [
            // BoxShadow(
            //   color: Colors.white.withOpacity(.2),
            //   blurRadius: 2,
            //   offset: const Offset(-5, 0),
            //   spreadRadius: 4,
            // ),
            // BoxShadow(
            //   color: Colors.white.withOpacity(.2),
            //   blurRadius: 2,
            //   offset: const Offset(0, -5),
            //   spreadRadius: 4,
            // ),
            // BoxShadow(
            //   color: Colors.white.withOpacity(.2),
            //   blurRadius: 2,
            //   offset: const Offset(0, 5),
            //   spreadRadius: 4,
            // ),
            // BoxShadow(
            //   color: Colors.white.withOpacity(.2),
            //   blurRadius: 2,
            //   offset: const Offset(5, 0),
            //   spreadRadius: 4,
            // )
            BoxShadow(
                blurRadius: 8, spreadRadius: 4, color: Colors.grey.shade200)
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              children: [
                SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.asset(
                    category[index].image,
                  ),
                ),
                const SizedBox(height: CSizes.sm),
                Text(
                  category[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: const Color.fromARGB(255, 5, 70, 9)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
