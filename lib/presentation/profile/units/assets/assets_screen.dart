import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/images.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/presentation/base/animated_widget.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/requests/widgets/title_container.dart';

import '../../../../domain/localization/language_constant.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool empty= false;
    return Scaffold(
      appBar: CustomAppBar(
        title:getTranslated("assets",context),
      ),
      body: !empty? SizedBox(
        height: context.height,
        child: ListAnimator(
          data: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.w),
                    decoration: BoxDecoration(
                      color: ColorResources.FILL_COLOR,
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(
                              "${getTranslated("asset_status", context)} ",style: AppTextStyles.w600.copyWith(
                                fontSize: 14,
                                color: ColorResources.HEADER
                            ),overflow: TextOverflow.fade,
                            ),
                          ),
                          titleContainer(title:getTranslated("active", context),color: ColorResources.ACTIVE,textColor: ColorResources.WHITE)
                        ],),
                        SizedBox(height: 24.h,),
                        Row(children: [
                          Expanded(
                            child: Text(
                              "${getTranslated("asset_type", context)} ",style: AppTextStyles.w600.copyWith(
                                fontSize: 14,
                                color: ColorResources.HEADER
                            ),overflow: TextOverflow.fade,
                            ),
                          ),
                          Text(getTranslated("car", context),style: AppTextStyles.w500.copyWith(
                              fontSize: 12,
                              color: ColorResources.PRIMARY
                          ),overflow: TextOverflow.fade,),

                          SizedBox(width: 8.w,)
                        ],),
                        SizedBox(height: 24.h,),
                        Row(children: [
                          Expanded(
                            child: Text(
                              "${getTranslated("from", context)} : ",style: AppTextStyles.w600.copyWith(
                                fontSize: 14,
                                color: ColorResources.HEADER
                            ),overflow: TextOverflow.fade,
                            ),
                          ),
                          Text(DateTime.now().format("dd-MMM-yyyy"),style: AppTextStyles.w500.copyWith(
                              fontSize: 12,
                              color: ColorResources.PRIMARY
                          ),overflow: TextOverflow.fade,
                          ),
                          SizedBox(width: 8.w,)
                        ],),
                      ],
                    ),),
                ],
              ),
            )
          ],
        ),
      ):SizedBox(
        height: context.height,
        child: ListAnimator(data: [
          Padding(
            padding:  EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 24.h,),
                  Image.asset(Images.emptyAsset),
                  SizedBox(height: 24.h,),
                  Text(
                    getTranslated("there_is_no_asset", context),style: AppTextStyles.w600.copyWith(
                    fontSize: 14,
                    color: ColorResources.HEADER,
                  ),overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ],),
            ),
          )
        ],),
      ),
    );
  }
}
