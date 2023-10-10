import 'package:flutter/cupertino.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Text(title,
              textAlign: TextAlign.center,
              style: AppTextStyles.w900.copyWith(
                color: Styles.PRIMARY_COLOR,
                fontSize: 22,
              )),
        ),
        SizedBox(
          height: 14.h,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Text(subTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.w600.copyWith(
                color: Styles.SUBTITLE,
                fontSize: 16,
              )),
        ),
      ],
    );
  }
}
