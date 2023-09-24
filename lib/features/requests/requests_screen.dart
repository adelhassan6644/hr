import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/requests/request_flow_screen.dart';
import 'package:hr_project/presentation/requests/widgets/request_card.dart';

import '../../app/core/text_styles.dart';
import '../../components/animated_widget.dart';
import '../../components/custom_app_bar.dart';
import '../../navigation/routes.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {

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
          color: ColorResources.WHITE,
          size: 20.h,
        ),
        label: Text(getTranslated("add", context),
            style: AppTextStyles.w600
                .copyWith(color: ColorResources.WHITE, fontSize: 14)),
        onPressed: () => CustomNavigator.push(Routes.ADD_REQUEST),
        backgroundColor: ColorResources.PRIMARY,
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
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
            child: SizedBox(
              height: context.height,
              child: ListAnimator(
                horizontalOffset: 0.0,
                durationMilli: 6 * 100,
                verticalOffset: 50,
                data: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            "4 ${getTranslated("results", context)}",
                            style: AppTextStyles.w600.copyWith(
                                fontSize: 12, color: ColorResources.HEADER),
                          ),
                          ...List.generate(
                            5,
                            (index) => Column(
                              children: [
                                SizedBox(height: 15.h),
                                RequestCard(
                                  status: "rejected",
                                  requestType: getTranslated("loan", context),
                                  reason: getTranslated("needing", context),
                                  onTap: () =>
                                      CustomNavigator.push(Routes.REQUESTS_FLOW,
                                          arguments: Model(
                                            requestType:
                                                getTranslated("loan", context),
                                            status: "rejected",
                                          )),
                                ),
                                SizedBox(height: 15.h),
                                RequestCard(
                                  status: "approved",
                                  requestType:
                                      getTranslated("vacation", context),
                                  reason: getTranslated("needing", context),
                                  onTap: () =>
                                      CustomNavigator.push(Routes.REQUESTS_FLOW,
                                          arguments: Model(
                                            requestType: getTranslated(
                                                "vacation", context),
                                            status: "approved",
                                          )),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
