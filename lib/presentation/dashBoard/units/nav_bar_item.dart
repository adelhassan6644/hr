import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';


navigationBarItems({ String? iconSvg,String? iconAsset, required String title}) {
  return BottomNavigationBarItem(
    activeIcon: iconSvg != null? SvgPicture.asset(
      iconSvg??"",
      color: ColorResources.primary,
      height: 25,
    ): Image.asset( iconAsset??"",
      color: ColorResources.primary,
      height: 25,
    ),
    label: title,
    icon: iconSvg != null? SvgPicture.asset(
      iconSvg??"",
       height: 25,
      color: ColorResources.disabledColor,
    ): Image.asset( iconAsset??"",
      height: 25,
      color: ColorResources.disabledColor,),
  );

}

