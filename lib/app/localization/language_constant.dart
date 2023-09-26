import 'package:flutter/material.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return AppLocalization.of(CustomNavigator.navigatorState.currentContext!)!
      .translate(key);
}
