import 'package:flutter/material.dart';

class ZSectionHeading extends StatelessWidget {
  const ZSectionHeading({
    super.key,
    this.buttonTitle = 'View all',
    this.showActionButton = true,
    this.textColor,
    this.onpPressed,
    required this.title,
  });

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onpPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          TextButton(onPressed: onpPressed, child: Text(buttonTitle))
      ],
    );
  }
}
