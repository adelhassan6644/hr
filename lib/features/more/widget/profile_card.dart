import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/profile/widgets/profile_image_widget.dart';
import 'package:hr_project/main_providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../data/config/di.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, child) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25,
            child: Center(
              child: IconButton(
                  onPressed: () => CustomNavigator.push(Routes.SETTINGS),
                  icon: const Icon(
                    Icons.settings,
                    color: Styles.PRIMARY_COLOR,
                    size: 25,
                  )),
            ),
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileImageWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                    sl<LocalizationProvider>().locale.languageCode == "ar"
                        ? provider.user?.arName ?? "اسم"
                        : provider.user?.enName ?? "name",
                    style: titleTextStyle),
              ),
              Center(
                  child: Text(provider.user?.description ?? "description",
                      style: hintTextStyle)),
            ],
          ),
          const Expanded(child: SizedBox()),
          const SizedBox(
            width: 25,
          )
        ],
      ).animate().flip().then(delay: 10.ms).shimmer();
    });
  }
}
