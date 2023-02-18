import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';

class BottomNavItem extends StatelessWidget {
final String? imageIcon;
final String? svgIcon;
final VoidCallback onTap;
final bool isSelected;
final String? name;
const BottomNavItem(
    {super.key, this.imageIcon,this.svgIcon , this.name,this.isSelected = false,
      required this.onTap,});

@override
Widget build(BuildContext context) {
  return InkWell(
    focusColor: ColorResources.transparentColor,
    highlightColor: ColorResources.transparentColor,
    splashColor: ColorResources.transparentColor,
    onTap: onTap,
    child: SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          svgIcon != null?
          SvgPicture.asset(
            svgIcon??"",
            color:isSelected ? ColorResources.PRIMARY :ColorResources.disabledColor ,
            width: 20,
            height:20,
          ):
          Image.asset(
            imageIcon??"",
            color:isSelected ? ColorResources.PRIMARY :ColorResources.disabledColor ,
            width: 20,
            height:20,
          ),
          name != null?
          Text(name??"",style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isSelected? ColorResources.PRIMARY
                :ColorResources.disabledColor,
            fontSize: 10,
          ),):const SizedBox.shrink()
        ],
      ),
    ),
  );
}
}

