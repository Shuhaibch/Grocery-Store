import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mechinetest/commen/images/c_rounded_images.dart';
import 'package:mechinetest/commen/shapes/container/rounded_container.dart';
import 'package:mechinetest/features/screens/customers/widgets/icons_row.dart';
import 'package:mechinetest/utils/constants/image_strings.dart';
import 'package:mechinetest/utils/helper/device_helper.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      height: CHelperFuntions.screenHeight() * .1,
      child: Row(
        children: [
          //* image
          CRoundedImage(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.all(10),
            height: CHelperFuntions.screenHeight() * .09,
            width: CHelperFuntions.screenWidth() * .2,
            imageUrl: CIMages.banner,
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
                            'Username',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                            softWrap: true,
                          ),
                          Text(
                            'ID: ID555',
                            style: Theme.of(context).textTheme.labelMedium,
                            softWrap: true,
                          ),
                          Text(
                            'Addresd kjrfadadadadwedsdasdadasdasdsadsad',
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
                Expanded(flex: 1, child: IconsRow()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
