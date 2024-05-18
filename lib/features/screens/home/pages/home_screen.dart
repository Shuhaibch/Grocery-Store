import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechinetest/commen/layout/grid_layout.dart';
import 'package:mechinetest/commen/shapes/container/search_container.dart';
import 'package:mechinetest/commen/shimmer/product_shimmer.dart';
import 'package:mechinetest/commen/text/section_heading.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/commen/widget/product/product_card.dart';
import 'package:mechinetest/features/controllers/home_controller.dart';
import 'package:mechinetest/features/controllers/search_controller.dart';
import 'package:mechinetest/features/screens/home/widgets/category_container.dart';
import 'package:mechinetest/features/screens/home/widgets/custom_promo_slidder.dart';
import 'package:mechinetest/features/screens/home/widgets/home_action_button.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(HomeController());
    final searchController = Get.put(ProductSearchController());

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
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  // search box
                  CSearchContainer(
                    controller: searchController.searchCTRL,
                    text: 'search grocecy',
                    padding: const EdgeInsets.all(10),
                    // onTap: ,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),

                  searchController.searchProduct.isNotEmpty
                      ? searchController.isLoading.value
                          ? const CProductShimmer()
                          : searchController.searchProduct.isNotEmpty
                              ? CGridLayout(
                                  itemCount:
                                      searchController.searchProduct.length,
                                  itemBuilder: (_, index) {
                                    final item = searchController
                                        .convertIntoProduct(searchController
                                            .searchProduct[index]);
                                    return ProductCard(
                                      isHome: true,
                                      product: item,
                                    );
                                  },
                                )
                              : Text('data')
                      :

//* normal body
                      Column(
                          children: [
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
                            Obx(
                              () {
                                return productController.isLoading.value
                                    ? const CProductShimmer()
                                    : productController.localProductList.isEmpty
                                        ? CGridLayout(
                                            itemCount: productController
                                                .productList.length,
                                            itemBuilder: (_, index) =>
                                                ProductCard(
                                              isHome: true,
                                              product: productController
                                                  .productList[index],
                                            ),
                                          )
                                        : CGridLayout(
                                            itemCount: productController
                                                .localProductList.length,
                                            itemBuilder: (_, index) =>
                                                ProductCard(
                                              isHome: true,
                                              product: productController
                                                  .localProductList[index],
                                            ),
                                          );
                              },
                            ),
                            const SizedBox(height: 70)
                          ],
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
