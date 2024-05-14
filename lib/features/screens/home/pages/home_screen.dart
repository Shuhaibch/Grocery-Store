import 'package:flutter/material.dart';
import 'package:mechinetest/commen/layout/grid_layout.dart';
import 'package:mechinetest/commen/shapes/container/search_container.dart';
import 'package:mechinetest/commen/text/section_heading.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/commen/widget/product/product_card.dart';
import 'package:mechinetest/features/screens/home/widgets/category_container.dart';
import 'package:mechinetest/features/screens/home/widgets/custom_promo_slidder.dart';
import 'package:mechinetest/features/screens/home/widgets/home_action_button.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App bar
      appBar: CAppbar(
        showBackArrow: false,
        actions: const [
          HomeActionButton(),
        ],
        title: Text("Good Day!👋🏻",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: const Color.fromARGB(255, 5, 70, 9))),
      ),
      //* body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // search box
              const CSearchContainer(
                text: 'search grocecy',
                padding: EdgeInsets.all(10),
              ),
              const SizedBox(height: CSizes.spaceBtwItem),

              // promo slider
              CPromoSlider(),
              const SizedBox(height: CSizes.spaceBtwItem),

              // Category
              const CSectionHeading(
                title: 'Categories',
                showActionButton: false,
              ),
              const SizedBox(height: CSizes.spaceBtwItem),

              SizedBox(
                height: 70,
                width: CHelperFuntions.screenWidth(),
                child: CategoryContainer(),
              ),
              const SizedBox(height: CSizes.spaceBtwItem),

              // Descovery
              const CSectionHeading(title: 'Discovery'),
              const SizedBox(height: CSizes.spaceBtwItem),

              // Product Card
              CGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const ProductCard(),
              ),
              const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
