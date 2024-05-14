import 'package:flutter/material.dart';
import 'package:mechinetest/commen/shapes/container/circular_container.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Milk',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$12',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        TextSpan(
                          text: '/kg',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //* Add Icon
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CCircularContainer(
                          height: 28,
                          radius: 28,
                          width: 28,
                          backgroundColor: Colors.transparent,
                          isGradient: true,
                          boxborder: Border.all(
                            color: const Color.fromARGB(255, 14, 111, 18),
                            width: 2,
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Color.fromARGB(255, 14, 111, 18),
                          ),
                        ),
                      ),
                      Text(
                        '1',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      )
                    ],
                  ),
                ),
                const CCircularContainer(
                  height: 28,
                  radius: 28,
                  width: 28,
                  backgroundColor: Color.fromARGB(255, 16, 142, 20),
                  isGradient: true,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
