import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechinetest/commen/shimmer/user_shimmer.dart';
import 'package:mechinetest/commen/widget/appbar/custom_appbar.dart';
import 'package:mechinetest/features/controllers/user_controller.dart';
import 'package:mechinetest/features/screens/customers/widgets/customer_tile.dart';
import 'package:mechinetest/features/screens/customers/widgets/search_bar.dart';
import 'package:mechinetest/features/screens/home/widgets/home_action_button.dart';
import 'package:mechinetest/utils/constants/sizes.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: CAppbar(
        centerTitle: true,
        actions: const [
          HomeActionButton(),
        ],
        title: Text("Customers",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: const Color.fromARGB(255, 5, 70, 9))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: CustomScrollView(
          slivers: [
            // search box
            SliverToBoxAdapter(
              child: CCustomerSearchContainer(
                text: 'Search Customer',
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                onTap: () {},
              ),
            ),
            Obx(
              () {
                if (userController.isLoading.value) {
                  return SliverToBoxAdapter(child: const CUserShimmer());
                }
                return userController.searchList.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final user = userController.searchList[index];
                          return InkWell(
                            onTap: () => userController.selectCurrentUser(user),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomerTile(user: user),
                            ),
                          );
                        }, childCount: userController.searchList.length),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final user = userController.allUserList[index];
                          return InkWell(
                            onTap: () => userController.selectCurrentUser(user),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomerTile(user: user),
                            ),
                          );
                        }, childCount: userController.allUserList.length),
                      );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
