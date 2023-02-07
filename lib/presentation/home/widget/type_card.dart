import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';

import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/dimensions.dart';

class TypeCard extends StatelessWidget {
  final String title ;
  final Widget icon;
  final Color iconColor;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  const TypeCard({required this.onTap,required this.icon,required this.title,this.width,this.height, required this.iconColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        width: width??context.width,
        height: height??80.h,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        decoration:  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorResources.grayColor.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: ColorResources.FILL),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor.withOpacity(0.1)),
              child: icon,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600),),
            ),
          ],
        ),
      ),
    );
  }
}
