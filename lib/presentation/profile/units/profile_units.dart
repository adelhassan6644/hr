import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/constant.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/images.dart';
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
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.1),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: const Offset(0, 3), // changes position of shadow
          //   ),
          // ],
          borderRadius: BorderRadius.circular(12),
          color: ColorResources.fillColor),
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
                        color: ColorResources.primary,
                        height: 25,
                        width: 25,
                      )
                    : Image.asset(
                        iconAsset ?? "",
                        height: 25,
                        width: 25,
                        color: ColorResources.primary,
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
            color: ColorResources.primary,
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
      decoration: BoxDecoration(
          color: ColorResources.fillColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: ColorResources.borderColor,
              style: BorderStyle.solid,
              width: 1)),
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
                        color: ColorResources.primary),
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
                    color: ColorResources.primary),
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
      children: [
        Column(children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorResources.primary,
                width: 1,
              ),
            ),
            child: ClipOval(
              child: profileImage == null
                  ? Image.asset(
                Images.profileIcon,
                height: 25,
                color: ColorResources.primary,
              )
                  : Image.file(profileImage!, fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 8,),
          Center(child: Text(name,style: titleTextStyle)),
          const SizedBox(height: 8,),
          Center(child: Text(description,style: hintTextStyle)),
        ],),
        IconButton(onPressed: onTap, icon: const Icon(Icons.settings,color: ColorResources.primary,size: 26,))
      ],
    ),
  );
}
