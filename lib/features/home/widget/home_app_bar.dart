import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/main_providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:yusrPlus/navigation/routes.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/images.dart';
import '../../../data/config/di.dart';
import '../../language/provider/localization_provider.dart';
import '../../profile/widgets/profile_image_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (context.toPadding + 12.h)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfileImageWidget(radius: 18),
          SizedBox(width: 8.w),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<UserProvider>(builder: (_, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        sl<LocalizationProvider>().locale.languageCode == "ar"
                            ? provider.user?.arName ?? ""
                            : provider.user?.enName ?? "",
                        style: titleTextStyle),
                    Center(
                        child: Text(provider.user?.jobRole?.jobTitle ?? "",
                            style: hintTextStyle)),
                  ],
                );
              }),
            ],
          )),
          SizedBox(width: 8.w),
          IconButton(
            icon: Image.asset(
              Images.notification,
              color: Styles.PRIMARY_COLOR,
              height: 25,
            ),
            onPressed: () => CustomNavigator.push(Routes.NOTIFICATIONS),
          ),
        ],
      ),
    ).animate().slide().then(delay: 50.ms).shimmer();
  }
}
