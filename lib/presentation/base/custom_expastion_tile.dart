import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/extensions.dart';

import '../../app/core/utils/text_styles.dart';



class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile( {Key? key,required this.title,required  this.children,this.opened = true}) : super(key: key);
  final bool opened ;
  final String title;
  final List<Widget> children ;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.w)),
      child: ExpansionTile(
        title: Text(
          title,
          style: AppTextStyles.w600.copyWith(
            fontSize: 16.0,
          ),
        ),
        iconColor: ColorResources.PRIMARY,
        backgroundColor:  ColorResources.BACKGROUND_COLOR,
        collapsedBackgroundColor: ColorResources.BACKGROUND_COLOR,
        collapsedShape: Border.all(
          color: ColorResources.BORDER_COLOR,
          width: 0.25,
          style: BorderStyle.solid
        ),
        shape:Border.all(
            color: ColorResources.BORDER_COLOR,
            width: 0.25,
            style: BorderStyle.solid
        ),
        collapsedTextColor: ColorResources.PRIMARY,
        initiallyExpanded: opened,
        childrenPadding:  EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        children: children,
      ),
    );
  }
}