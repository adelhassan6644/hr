import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/features/requests/widgets/title_container.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';

class RequestCard extends StatelessWidget {
  const RequestCard(
      {this.onTap,
      required this.status,
      required this.reason,
      required this.requestType,
      Key? key})
      : super(key: key);
  final Function()? onTap;
  final String status;
  final String requestType;
  final String reason;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: context.width,
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        padding:
            EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Styles.LIGHT_BORDER_COLOR),
          color: Styles.WHITE,
          boxShadow: kElevationToShadow[1],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleContainer(
                      title: status == "rejected"
                          ? getTranslated(status, context)
                              .replaceAll("ال", "")
                              .replaceAll("ة", "")
                          : getTranslated(status, context),
                      color: Styles.getStatusColor(status),
                      textColor: Colors.white),
                  titleContainer(
                    title: DateTime.now().format("EEEE dd MMMM"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 1,
              color: Styles.BORDER_COLOR,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT),
              child: SizedBox(
                width: context.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => titleContainer(
                            title: requestType,
                            color: Styles.PRIMARY_COLOR,
                            textColor: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT),
              child: SizedBox(
                width: context.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      titleContainer(
                        title: reason,
                        icon: Icons.question_mark,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
