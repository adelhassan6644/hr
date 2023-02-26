import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/images.dart';
import '../../navigation/custom_navigation.dart';

loadingDialog()
{
  return showAnimatedDialog(
    context: CustomNavigator.navigatorState.currentContext!,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return   Center(
        child: Image.asset(
          Images.splash,

          height: MediaQuery.of(context).size.width * .5,
          width: MediaQuery.of(context).size.width * .5,
        ) .animate(onPlay: (controller) => controller.repeat())

            .shimmer(duration: .5.seconds, )
           ,
      );
    },
    animationType: DialogTransitionType.scale,
    curve: Curves.easeInOutBack,
    duration: const Duration(milliseconds: 700),
  );
}