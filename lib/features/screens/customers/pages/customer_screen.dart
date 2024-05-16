import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mechinetest/commen/shapes/container/curved_container.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/features/screens/customers/widgets/customer_tile.dart';
import 'package:mechinetest/features/screens/customers/widgets/search_bar.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/sizes.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppbar(
        centerTitle: true,
        actions: const [
          Icon(Icons.menu),
        ],
        title: Text("Customers",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: const Color.fromARGB(255, 5, 70, 9))),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // search box
                  CCustomerSearchContainer(
                    text: 'Search Customer',
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    onTap: () {},
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => const CustomerTile(),
                  ),
                  const SizedBox(height: 100)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: CCurvedContainer(
                        backgroundColor: CColors.secondaryColor.withOpacity(.5),
                        x: 20,
                        y: 25,
                        width: CHelperFuntions.screenWidth() * .88,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: CRoundedContainer(
                              backgroundColor: Colors.transparent,
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                //* inner row
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            '\$45',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                    fontSize: 27,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CRoundedContainer(
                                      isGradient: true,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: CSizes.sm + 5,
                                          horizontal: CSizes.lg),
                                      backgroundColor: CColors.accentColor,
                                      child: Text(
                                        'CHECKOUT NOW',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
