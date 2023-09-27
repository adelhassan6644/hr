import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';

class AddRequestButton extends StatelessWidget {
  const AddRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      isExtended: true,
      icon: Icon(
        Icons.add,
        color: Styles.WHITE,
        size: 20.h,
      ),
      label: Text(getTranslated("add", context),
          style:
              AppTextStyles.w600.copyWith(color: Styles.WHITE, fontSize: 14)),
      onPressed: () => CustomNavigator.push(Routes.ADD_REQUEST),
      backgroundColor: Styles.PRIMARY_COLOR,
    );
  }
}
