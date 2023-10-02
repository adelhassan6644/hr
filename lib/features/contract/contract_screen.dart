import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/images.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/features/requests/widgets/title_container.dart';

import '../../../../app/core/dimensions.dart';
import '../../app/localization/language_constant.dart';
import '../../../../components/animated_widget.dart';
import '../../../../components/custom_app_bar.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool empty = false;
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("contract", context),
      ),
      body: !empty
          ? SizedBox(
              height: context.height,
              child: ListAnimator(
                data: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Container(
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.w),
                          decoration: BoxDecoration(
                            color: Styles.FILL_COLOR,
                            borderRadius: BorderRadius.circular(12.w),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      getTranslated(
                                          "employment_contract", context),
                                      style: AppTextStyles.w600.copyWith(
                                          fontSize: 14, color: Styles.HEADER),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  titleContainer(
                                      title: getTranslated("active", context),
                                      color: Styles.ACTIVE,
                                      textColor: Styles.WHITE)
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${getTranslated("contract_starting_date", context)} : ",
                                      style: AppTextStyles.w600.copyWith(
                                          fontSize: 14, color: Styles.HEADER),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  Text(
                                    DateTime.now().format("dd-MMM-yyyy"),
                                    style: AppTextStyles.w500.copyWith(
                                        fontSize: 12,
                                        color: Styles.PRIMARY_COLOR),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${getTranslated("contract_duration", context)} : ",
                                      style: AppTextStyles.w600.copyWith(
                                          fontSize: 14, color: Styles.HEADER),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  Text(
                                    getTranslated("unlimited_time", context),
                                    style: AppTextStyles.w500.copyWith(
                                        fontSize: 12,
                                        color: Styles.PRIMARY_COLOR),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : SizedBox(
              height: context.height,
              child: ListAnimator(
                data: [
                  Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.w),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          Image.asset(Images.emptyContract),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            getTranslated("there_is_no_contract", context),
                            style: AppTextStyles.w600.copyWith(
                              fontSize: 14,
                              color: Styles.HEADER,
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
