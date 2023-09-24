import 'package:flutter/material.dart';

import '../app/core/color_resources.dart';
import '../app/core/text_styles.dart';


class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget(
      {required this.title, required this.children, this.childrenPadding, this.iconColor, Key? key})
      : super(key: key);
  final String title;
  final List<Widget> children;
  final double? childrenPadding;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppTextStyles.w700.copyWith(
            fontSize: 14, color: ColorResources.PRIMARY),
      ),
      tilePadding: const EdgeInsets.all(0),
      childrenPadding:  EdgeInsets.all(childrenPadding??0),
      collapsedIconColor: ColorResources.PRIMARY,
      initiallyExpanded: true,
      iconColor: iconColor??ColorResources.PRIMARY,
      shape: Border.all(color: Colors.transparent, width: 0, style: BorderStyle.none),
      collapsedShape: Border.all(color: Colors.transparent, width: 0, style: BorderStyle.none),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
