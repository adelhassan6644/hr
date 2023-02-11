import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_button.dart';

import '../../navigation/custom_navigation.dart';

abstract class CustomBottomSheet {
  static show(
      {Function? onConfirm,
      @required String? label,
      @required Widget? list,
      double? height,
      BuildContext? context}) {
    showModalBottomSheet(
      context: context ?? CustomNavigator.navigatorState.currentContext!,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Material(
          type: MaterialType.transparency,
          child: SafeArea(
            bottom: true,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                height: height ?? 240.h,
                decoration: const BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                             SizedBox(height: 24.h),
                            Text(
                              label!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                             SizedBox(height: 16.h),
                            Expanded(child: list!)
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: onConfirm != null,
                      child: CustomButton(
                          text: getTranslated('submit', CustomNavigator.navigatorState.currentContext!),
                          onTap: () {
                            onConfirm!();
                          },
                        backgroundColor: ColorResources.PRIMARY,
                        textColor: ColorResources.WHITE,),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
