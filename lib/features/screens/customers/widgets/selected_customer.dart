import 'package:flutter/material.dart';
import 'package:mechinetest/commen/images/c_rounded_images.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/features/controllers/user_controller.dart';
import 'package:mechinetest/features/models/user/all_user_model.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class SelectedCustomerTile extends StatelessWidget {
  const SelectedCustomerTile({
    super.key,
    required this.user,
  });
  final AllUser user;
  @override
  Widget build(BuildContext context) {
    final cntroller = UserController.instance;
    return CRoundedContainer(
      height: CHelperFuntions.screenHeight() * .05,
      borderColor: cntroller.selectedUser.value == user
          ? CColors.themeColor
          : CColors.borderPrimaryColor,
      child: Row(
        children: [
          //* image
          user.profilePic == '' || user.profilePic.isEmpty
              ? CRoundedImage(
                  padding: const EdgeInsets.all(10),
                  height: CHelperFuntions.screenHeight() * .09,
                  width: CHelperFuntions.screenWidth() * .2,
                  isNetworkImage: false,
                  imageUrl: CIMages.iconUser,
                  fit: BoxFit.cover,
                )
              : CRoundedImage(
                  isNetworkImage: true,
                  padding: const EdgeInsets.all(10),
                  height: CHelperFuntions.screenHeight() * .09,
                  width: CHelperFuntions.screenWidth() * .2,
                  imageUrl: 'http://143.198.61.94:8000${user.profilePic}',
                  fit: BoxFit.cover,
                ),

          // Devider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 1,
              height: 50,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.black,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
          ),

          //* text
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                            softWrap: true,
                          ),
                          Text(
                            'ID: ${user.id}',
                            style: Theme.of(context).textTheme.labelMedium,
                            softWrap: true,
                          ),
                          Text(
                            '${user.city},${user.country} ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
