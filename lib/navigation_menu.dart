import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mechinetest/features/screens/customers/pages/customer_screen.dart';
import 'package:mechinetest/features/screens/home/pages/home_screen.dart';
import 'package:mechinetest/features/screens/products/pages/products_screen.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(400, 20),
            topRight: Radius.elliptical(400, 20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(
              height: 80,
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.home_15,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.shop,
                      ),
                      label: 'Products'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Iconsax.user,
                      ),
                      label: 'Customer'),
                ],
                currentIndex: controller.selectedIndex.value,
                elevation: 0,
                onTap: (index) {
                  controller.selectedIndex.value = index;
                },
                enableFeedback: false,

                // type: BottomNavigationBarType.fixed,
                // backgroundColor: Colors.transparent,
                backgroundColor: CColors.secondaryColor.withOpacity(.5),
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color.fromARGB(255, 2, 136, 8),
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                unselectedIconTheme: const IconThemeData(
                  color: CColors.accentColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    const HomeScreen(),
    const ProductScreen(),
    const CustomerScreen(),
  ];
}
