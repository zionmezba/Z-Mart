import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:z_mart/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class ZChoiceChip extends StatelessWidget {
  const ZChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = ZHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? ZColors.white : null),
        avatar: isColor
            ? ZCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: ZHelperFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? ZHelperFunctions.getColor(text)! : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
