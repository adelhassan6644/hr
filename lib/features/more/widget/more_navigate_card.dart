import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/components/custom_images.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../data/config/di.dart';

class MoreNavigateCard extends StatelessWidget {
  const MoreNavigateCard(
      {required this.name,
      this.iconAsset,
      this.iconSvg,
      this.onTap,
      super.key});

  final String name;
  final String? iconAsset, iconSvg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Styles.LIGHT_BORDER_COLOR))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: iconSvg != null
                      ? customImageIconSVG(
                          imageName: iconSvg ?? "",
                          color: Styles.PRIMARY_COLOR,
                          height: 25,
                          width: 25,
                        )
                      : customImageIcon(
                          imageName: iconAsset ?? "",
                          height: 25,
                          width: 25,
                          color: Styles.PRIMARY_COLOR,
                        )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            RotatedBox(
              quarterTurns:
                  sl<LocalizationProvider>().locale.languageCode == "ar"
                      ? 2
                      : 0,
              child: const Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Styles.disabledColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
