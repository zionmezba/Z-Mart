import 'package:flutter/material.dart';

class ZAnimationLoaderWidget extends StatelessWidget {
  const ZAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  final String text;
  final String animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
