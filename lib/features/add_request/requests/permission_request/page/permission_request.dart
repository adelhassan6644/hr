import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../../../app/core/text_styles.dart';
import '../../../../../app/core/validation.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_bottom_sheet.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_date_time_picker.dart';
import '../../../../../components/custom_expansion_tile.dart';
import '../../../../../components/custom_single_selector.dart';
import '../../../../../components/custom_text_form_field.dart';
import '../../../../../data/config/di.dart';
import '../../../../../navigation/custom_navigation.dart';
import '../../../widgets/request_reason.dart';
import '../provider/permission_request_provider.dart';
import '../repo/permission_request_repo.dart';

class PermissionRequest extends StatefulWidget {
  const PermissionRequest({Key? key}) : super(key: key);

  @override
  State<PermissionRequest> createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          PermissionRequestProvider(repo: sl<PermissionRequestRepo>()),
      child: Consumer<PermissionRequestProvider>(
          builder: (context, provider, child) {
        return Scaffold(
          appBar:
              CustomAppBar(title: getTranslated("permission_request", context)),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListAnimator(
                    customPadding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                        vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    data: [
                      /// The Expense Claim Details
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: CustomExpansionTile(
                          title: getTranslated("permission_details", context),
                          children: [
                            CustomTextFormField(
                              sufWidget: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Styles.disabledColor,
                                size: 18,
                              ),
                              controller: TextEditingController(
                                  text:
                                      provider.selectedPermissionType?.name ??
                                          ""),
                              hint: getTranslated("permission_type", context),
                              read: true,
                              onTap: () {
                                if (provider.isGetting) {
                                  CustomSnackBar.showSnackBar(
                                      notification: AppNotification(
                                          message: getTranslated(
                                              "please_wait", context),
                                          isFloating: true,
                                          backgroundColor: Styles.PENDING,
                                          borderColor: Colors.transparent));
                                } else if (!provider.isGetting &&
                                    provider.types.isEmpty) {
                                  CustomSnackBar.showSnackBar(
                                      notification: AppNotification(
                                          message: getTranslated(
                                              "there_is_no_data", context),
                                          isFloating: true,
                                          backgroundColor: Styles.PENDING,
                                          borderColor: Colors.transparent));
                                } else {
                                  CustomBottomSheet.show(
                                      label: getTranslated(
                                          "permission_type", context),
                                      height: 400.h,
                                      list: CustomSingleSelector(
                                        onConfirm: provider.onSelectLoanType,
                                        list: provider.types,
                                        initialValue:
                                            provider.selectedPermissionType?.id,
                                      ),
                                      onConfirm: () => CustomNavigator.pop());
                                }
                              },
                              valid: (v) => Validations.required(
                                  v,
                                  getTranslated(
                                      "select_permission_type", context)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: CustomSelectDate(
                                  valueChanged: provider.onSelectDate,
                                  startDateTime: provider.selectedDate,
                                  label: getTranslated("date", context)),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w),
                                        child: Text(
                                          getTranslated("start_time", context),
                                          style: AppTextStyles.w500.copyWith(
                                              fontSize: 13,
                                              color: Styles.SUBTITLE),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      CustomSelectDate(
                                          startDateTime: provider.startDate,
                                          mode: CupertinoDatePickerMode.time,
                                          format: "hh:mm a",
                                          valueChanged:
                                              provider.onSelectStartDate,
                                          label:
                                              getTranslated("from", context)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.w),
                                        child: Text(
                                          getTranslated("end_time", context),
                                          style: AppTextStyles.w500.copyWith(
                                              fontSize: 13,
                                              color: Styles.SUBTITLE),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      CustomSelectDate(
                                          startDateTime: provider.endDate,
                                          mode: CupertinoDatePickerMode.time,
                                          format: "hh:mm a",
                                          valueChanged:
                                              provider.onSelectEndDate,
                                          label: getTranslated("to", context)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// The Request Reason
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: RequestReason(
                          reasonController: provider.reason,
                          attachments: provider.attachments,
                          onGet: provider.onSelectAttachments,
                          onRemove: provider.onRemoveAttachments,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
              vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
            ),
            child: CustomButton(
              text: getTranslated("submit", context),
              onTap: () {
                if (formKey.currentState!.validate()) {
                  provider.onSubmit();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
