import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/base/image_widget.dart';
import 'package:hr_project/presentation/notifier/localization_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/constant.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../data/model/user_model.dart';
import '../../../domain/localization/language_constant.dart';
import '../../../navigation/routes.dart';

settingCard(
    {required String name,
    String? iconAsset,
    String? iconSvg,
    context,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
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
           SizedBox(
            width: 10.w,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          RotatedBox(
            quarterTurns: Provider.of<LocalizationProvider>(CustomNavigator.navigatorState.currentContext!,listen: false).locale.languageCode == "ar" ?2:0,
            child: const Icon(
              Icons.keyboard_arrow_right_sharp,
              color: ColorResources.PRIMARY,
            ),
          )
        ],
      ),
    ),
  );
}

annualLeaveBalance({context, required VoidCallback onTap,required int days}) {
  return Padding(
    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
    child: Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration:  BoxDecoration(
          color: ColorResources.FILL_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
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

profileCard({required UserModel user,context}){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Column(children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.FILL_COLOR
            ),
            child:
              user.image == null
                  ? const ClipOval(child: Icon(Icons.person,color: ColorResources.disabledColor,size: 80,)) :
              ImageWidget.network(user.image!,width: 100.w,height: 100.h,border:BorderRadius.circular(100)),

          ),
          const SizedBox(height: 8,),
          Center(child: Text(Provider.of<LocalizationProvider>(context,listen: false).locale.languageCode == "ar"?user.arName??"":user.enName??"",style: titleTextStyle)),
          const SizedBox(height: 8,),
          Center(child: Text(user.description??"",style: hintTextStyle)),
        ],).animate().flip().then(delay:10.ms).shimmer(),
        IconButton(onPressed: () => CustomNavigator.push(Routes.SETTINGS), icon: const Icon(Icons.settings,color: ColorResources.PRIMARY,size: 26,)),

      ],
    ),
  );
}
