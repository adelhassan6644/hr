import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/components/custom_app_bar.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../components/custom_images.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key, this.withBack = false}) : super(key: key);
  final bool withBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: context.width,
          height: context.height * 0.30,
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          decoration: const BoxDecoration(
            color: Styles.PRIMARY_COLOR,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.toPadding),
              FittedBox(
                child: Center(
                  child: customImageIcon(
                    imageName: Images.logo,
                    height: context.height * 0.20,
                    width: context.width,
                  ),
                ),
              ),
            ],
          ),
        ).animate().moveY(
              delay: 300.ms,
              duration: 600.ms,
            ),
        Visibility(
            visible: withBack,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: const CustomAppBar(
                fromAuth: true,
              ),
            )),
      ],
    );
  }
}
