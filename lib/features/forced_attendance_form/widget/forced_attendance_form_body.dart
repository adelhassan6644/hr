import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/components/custom_button.dart';
import 'package:yusrPlus/features/forced_attendance_form/provider/forced_attendance_form_provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_images.dart';
import '../../../components/image_pop_up_viewer.dart';
import '../../../helpers/image_picker_helper.dart';

class ForcedAttendanceFormBody extends StatelessWidget {
  const ForcedAttendanceFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForcedAttendanceFormProvider>(
        builder: (_, provider, child) {
      return Column(
        children: [
          Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
              data: [
                SizedBox(height: 12.h),

                ///Title
                Text(
                  getTranslated("pick_image_to_check_in", context),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.w700
                      .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 18),
                ),

                ///Image
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: GestureDetector(
                      onTap: () {
                        if (provider.image != null) {
                          Future.delayed(
                              Duration.zero,
                              () => showDialog(
                                  context: context,
                                  barrierColor: Colors.black.withOpacity(0.75),
                                  builder: (context) {
                                    return ImagePopUpViewer(
                                      image: provider.image,
                                      isFromInternet: false,
                                      title: "",
                                    );
                                  }));
                        }
                      },
                      child: DottedBorder(
                        color: Styles.PRIMARY_COLOR,
                        strokeCap: StrokeCap.square,
                        borderType: BorderType.RRect,
                        dashPattern: const [10, 10],
                        radius: const Radius.circular(12),
                        child: Container(
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 24.w, vertical: 24.h),
                            height: 200,
                            width: context.width,
                            decoration: BoxDecoration(
                              color: Styles.PRIMARY_COLOR.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: provider.image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(provider.image!.path),
                                      fit: BoxFit.cover,
                                    ))
                                : Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Expanded(child: SizedBox()),
                                        customImageIconSVG(
                                            imageName: SvgImages.uploadDocument,
                                            height: 24.h,
                                            width: 24.w,
                                            color: Styles.PRIMARY_COLOR),
                                        SizedBox(height: 8.h),
                                        Text(
                                          getTranslated("pick_image", context),
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.w500.copyWith(
                                              color: Styles.PRIMARY_COLOR,
                                              fontSize: 14),
                                        ),
                                        const Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  )),
                      )),
                ),

                ///Pick Image Button
                CustomButton(
                  backgroundColor: Styles.PRIMARY_COLOR.withOpacity(0.1),
                  textColor: Styles.PRIMARY_COLOR,
                  fIconWidget: const Icon(
                    Icons.camera_alt,
                    color: Styles.PRIMARY_COLOR,
                    size: 20,
                  ),
                  text: getTranslated(
                      provider.image != null ? "edit" : "pick_image", context),
                  onTap: () async => await ImagePickerHelper.openCamera(
                      back: false, onGet: provider.onSelectImage),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
