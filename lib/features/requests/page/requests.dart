import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/requests/request_flow_screen.dart';
import 'package:hr_project/features/requests/widgets/request_card.dart';
import 'package:hr_project/navigation/custom_navigation.dart';

import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../navigation/routes.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("requests", context),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: Icon(
          Icons.add,
          color: Styles.WHITE,
          size: 20.h,
        ),
        label: Text(getTranslated("add", context),
            style:
                AppTextStyles.w600.copyWith(color: Styles.WHITE, fontSize: 14)),
        onPressed: () => CustomNavigator.push(Routes.ADD_REQUEST),
        backgroundColor: Styles.PRIMARY_COLOR,
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification sn) {
          if (sn is ScrollUpdateNotification &&
              sn.metrics.pixels == sn.metrics.maxScrollExtent &&
              sn.metrics.axisDirection == AxisDirection.down) {
            log("Pagination");
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            log("RefreshIndicator");
          },
          child: Column(
            children: [
              Expanded(
                child: ListAnimator(
                  customPadding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                  data: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Text(
                        "4 ${getTranslated("results", context)}",
                        style: AppTextStyles.w600
                            .copyWith(fontSize: 12, color: Styles.HEADER),
                      ),
                    ),
                    ...List.generate(
                      5,
                      (index) => RequestCard(
                        status: "rejected",
                        requestType: getTranslated("loan", context),
                        reason: getTranslated("needing", context),
                        onTap: () => CustomNavigator.push(Routes.REQUESTS_FLOW,
                            arguments: Model(
                              requestType: getTranslated("loan", context),
                              status: "rejected",
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
