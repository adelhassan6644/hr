import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/images.dart';
import '../../profile/widgets/profile_image_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (context.toPadding + 12.h), bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ProfileImageWidget(radius: 18),
                SizedBox(width: 8.w),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Software Cloud 2", style: titleTextStyle),
                    Center(child: Text("Manager", style: hintTextStyle)),
                  ],
                ),
              ],
            ).animate().flip().then(delay: 10.ms).shimmer(),
          ),
          IconButton(
            icon: Image.asset(
              Images.notification,
              color: Styles.PRIMARY_COLOR,
              height: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
