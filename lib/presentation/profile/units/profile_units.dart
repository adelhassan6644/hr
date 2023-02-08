import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/constant.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../domain/localization/language_constant.dart';

settingCard(
    {required String name,
    String? iconAsset,
    String? iconSvg,
    context,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorResources.FILL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: iconSvg != null
                    ? SvgPicture.asset(
                  iconSvg,
                  color: ColorResources.PRIMARY,
                  height: 25,
                  width: 25,
                )
                    : Image.asset(
                        iconAsset ?? "",
                        height: 25,
                        width: 25,
                        color: ColorResources.PRIMARY,
                      )),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            color: ColorResources.PRIMARY,
          )
        ],
      ),
    ),
  );
}

annualLeaveBalance({context, required VoidCallback onTap,required double days}) {
  return Padding(
    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
    child: Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: const BoxDecoration(
          color: ColorResources.FILL,
          borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated("annual_leave_balance", context),
                style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorResources.disabledColor),
              ),
              TextButton(
                  onPressed: onTap,
                  child: Text(
                    getTranslated("view_details", context),
                    style: titleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorResources.PRIMARY),
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "$days ${getTranslated("days", context)}",
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: ColorResources.PRIMARY),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                getTranslated("available_to_use", context),
                style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorResources.disabledColor),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}

profileCard({File? profileImage,required String name,required String description,required VoidCallback onTap}){
  return Padding(
    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Column(children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.FILL
            ),
            child: ClipOval(
              child: profileImage == null
                  ? const Icon(Icons.person,color: ColorResources.disabledColor,size: 80,)
                  : Image.file(profileImage, fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 8,),
          Center(child: Text(name,style: titleTextStyle)),
          const SizedBox(height: 8,),
          Center(child: Text(description,style: hintTextStyle)),
        ],),
        IconButton(onPressed: onTap, icon: const Icon(Icons.settings,color: ColorResources.PRIMARY,size: 26,)),

      ],
    ),
  );
}
