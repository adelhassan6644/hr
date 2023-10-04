import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/features/requests/widgets/title_container.dart';

import '../../../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("contract", context),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: Styles.FILL_COLOR),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
