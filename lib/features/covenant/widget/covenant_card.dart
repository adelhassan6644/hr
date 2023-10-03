import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../requests/widgets/title_container.dart';

class CovenantCard extends StatelessWidget {
  const CovenantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Styles.FILL_COLOR),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "${getTranslated("covenant_status", context)} ",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
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
                  "${getTranslated("covenant_type", context)} ",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                getTranslated("car", context),
                style: AppTextStyles.w500
                    .copyWith(fontSize: 12, color: Styles.PRIMARY_COLOR),
                overflow: TextOverflow.fade,
              ),
              SizedBox(
                width: 8.w,
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${getTranslated("from", context)} : ",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                DateTime.now().format("d / MMM / yyyy"),
                style: AppTextStyles.w500
                    .copyWith(fontSize: 12, color: Styles.PRIMARY_COLOR),
                overflow: TextOverflow.fade,
              ),
              SizedBox(
                width: 8.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}
