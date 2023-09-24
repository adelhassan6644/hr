import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_date_time_picker.dart';
import '../../../components/custom_drop_down_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/add_request_provider.dart';
import '../widgets/request_reason.dart';

class LetterRequest extends StatefulWidget {
  const LetterRequest({Key? key}) : super(key: key);

  @override
  State<LetterRequest> createState() => _LetterRequestState();
}

class _LetterRequestState extends State<LetterRequest> {

  late TextEditingController reason;

  DateTime? date;
  File? image;


  @override
  void initState() {
    reason = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("letter_request", context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [

              /// The Letter Details
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                        color: ColorResources.BORDER_COLOR,
                        width: 0.5,
                        style: BorderStyle.solid)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: Text(
                        getTranslated("letter_details", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Consumer<AddRequestProvider>(
                        builder: (context, addRequestProvider, child) {
                          return CustomDropDownButton(
                              items: addRequestProvider.loanTypes,
                              onChange: addRequestProvider.onSelectLoanType,
                              name: getTranslated("letter_type", context),
                              pIcon: Images.letter,
                              pIconColor: ColorResources.hintColor);
                        }
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSelectDate(
                        format: "dd,MMM,yyyy",
                        valueChanged: (value) {
                          setState(() {
                            date = value;
                          });
                        },
                        label: getTranslated("date", context)
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.letter,
                      label: true,
                      removePIcon: false,
                      tIconColor: ColorResources.hintColor,
                      hint: getTranslated("subject_to_en", context),
                      onTap: (){},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.letter,
                      removePIcon: false,
                      label: true,
                      tIconColor: ColorResources.hintColor,
                      hint: getTranslated("subject_to_ar", context),
                      onTap: (){},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              /// The Request Reason
              RequestReason(reasonController: reason),
              SizedBox(
                height: 25.h,
              ),

              ///Submit
              Consumer<AddRequestProvider>(
                  builder: (context, addRequestProvider, child) {
                    return CustomButton(
                        textColor: ColorResources.WHITE,
                        text: getTranslated("submit", context),
                        onTap: () => addRequestProvider.onSubmit(),
                        backgroundColor: ColorResources.PRIMARY);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
