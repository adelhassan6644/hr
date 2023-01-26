import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/images.dart';

loadingDialog(BuildContext context)
{
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30.0)),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            Images.logo,
            height: MediaQuery.of(context).size.width * .3,
            width: MediaQuery.of(context).size.width * .3,
          ),
            const Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Text(
             "please_wait",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: ColorResources.DISABLE_COLOR,
              ),
            ),
          ),
        ]),
      );
    },
    animationType: DialogTransitionType.slideFromRight,
    curve: Curves.easeInOutBack,
    duration: const Duration(milliseconds: 700),
  );
}