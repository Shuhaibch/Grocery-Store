import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';

class CSectionHeading extends StatelessWidget {
  const CSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "See all",
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onPressed,
                child: Text(buttonTitle),
              ),
              const Icon(
                CupertinoIcons.right_chevron,
                size: 10,
                color: CColors.accentColor,
              )
            ],
          )
      ],
    );
  }
}
