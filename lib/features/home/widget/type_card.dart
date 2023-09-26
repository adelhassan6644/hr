import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';

class TypeCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final Color iconColor;
  final VoidCallback onTap;
  const TypeCard(
      {required this.onTap,
      required this.icon,
      required this.title,
      required this.iconColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Styles.FILL_COLOR),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: iconColor.withOpacity(0.1)),
              child: icon,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
