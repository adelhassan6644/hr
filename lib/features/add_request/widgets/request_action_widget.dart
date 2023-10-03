import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/dimensions.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/features/language/provider/localization_provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';
import '../../../data/config/di.dart';

class RequestActionWidget extends StatelessWidget {
  const RequestActionWidget(
      {super.key, required this.title, this.onTap, this.icon, this.astIcon});

  final String title;
  final Function()? onTap;
  final IconData? icon;
  final String? astIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            right: sl<LocalizationProvider>().locale.languageCode == "ar"
                ? 8.w
                : 0,
            left: sl<LocalizationProvider>().locale.languageCode == "en"
                ? 8.w
                : 0),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            decoration: BoxDecoration(
              color: Styles.FILL_COLOR,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Styles.BORDER_COLOR),
            ),
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 20,
                  ),
                if (astIcon != null)
                  Image.asset(
                    astIcon ?? "",
                    color: Styles.SUBTITLE,
                    height: 20,
                    width: 20,
                  ),
                if (astIcon != null || icon != null)
                  SizedBox(
                    width: 16.w,
                  ),
                Text(
                  title,
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.SUBTITLE),
                ),
              ],
            )),
      ),
    );
  }
}
