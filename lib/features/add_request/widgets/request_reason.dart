import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/svg_images.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/validation.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_images.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/file_container.dart';
import '../../../helpers/file_picker_helper.dart';

class RequestReason extends StatelessWidget {
  const RequestReason(
      {Key? key,
      required this.reasonController,
      this.attachments,
      this.onRemove,
      this.onGet})
      : super(key: key);
  final TextEditingController reasonController;
  final Function(File)? onGet;
  final Function(List<File>?)? onRemove;
  final List<File>? attachments;
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: getTranslated("reason", context),
      children: [
        CustomTextFormField(
          // pAssetIcon: Images.question,
          hint: getTranslated("reason", context),
          controller: reasonController,
          label: true,
          maxLine: 5,
          keyboardAction: TextInputAction.newline,
          valid: (v) =>
              Validations.required(v, getTranslated("enter_reason", context)),
        ),
        SizedBox(
          height: 16.h,
        ),

        /// Select attachments
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: GestureDetector(
                onTap: () {
                  FilePickerHelper.pickFile(
                    onSelected: onGet,
                  );
                },
                child: DottedBorder(
                  color: Styles.PRIMARY_COLOR,
                  strokeCap: StrokeCap.square,
                  borderType: BorderType.RRect,
                  dashPattern: const [10, 10],
                  radius: const Radius.circular(12),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      width: context.width,
                      decoration: BoxDecoration(
                        color: Styles.PRIMARY_COLOR.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            customImageIconSVG(
                                imageName: SvgImages.uploadDocument,
                                height: 24.h,
                                width: 24.w,
                                color: Styles.PRIMARY_COLOR),
                            SizedBox(height: 8.h),
                            Text(
                              getTranslated("upload_attachment", context),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.w500.copyWith(
                                  color: Styles.PRIMARY_COLOR, fontSize: 14),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),

            ///selected files
            Visibility(
                visible: attachments != null && attachments!.isNotEmpty,
                child: FileContainer(
                  onRemove: onRemove!,
                  attachments: attachments,
                ))
          ],
        )
      ],
    );
  }
}
