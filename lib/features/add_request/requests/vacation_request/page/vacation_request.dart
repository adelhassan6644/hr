import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../app/core/color_resources.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../../../app/core/images.dart';
import '../../../../../app/core/text_styles.dart';
import '../../../../../app/core/validation.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_bottom_sheet.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_date_time_picker.dart';
import '../../../../../components/custom_expansion_tile.dart';
import '../../../../../components/custom_single_selector.dart';
import '../../../../../components/custom_text_form_field.dart';
import '../../../../../data/config/di.dart';
import '../../../../../navigation/custom_navigation.dart';
import '../../../widgets/request_reason.dart';
import '../provider/vacation_request_provider.dart';
import '../repo/vacation_request_repo.dart';

class VacationRequest extends StatefulWidget {
  const VacationRequest({Key? key}) : super(key: key);

  @override
  State<VacationRequest> createState() => _VacationRequestState();
}

class _VacationRequestState extends State<VacationRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VacationRequestProvider(repo: sl<VacationRequestRepo>()),
      child: Consumer<VacationRequestProvider>(
          builder: (context, provider, child) {
        return Scaffold(
          appBar:
              CustomAppBar(title: getTranslated("vacation_request", context)),
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
                      /// The Vacation Details
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: CustomExpansionTile(
                          title: getTranslated("vacation_details", context),
                          children: [
                            CustomTextFormField(
                              sufWidget: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Styles.disabledColor,
                                size: 18,
                              ),
                              controller: TextEditingController(
                                  text: provider.selectedVacationType?.title ??
                                      ""),
                              hint: getTranslated("vacation_type", context),
                              read: true,
                              onTap: () => CustomBottomSheet.show(
                                  label:
                                      getTranslated("vacation_type", context),
                                  height: 400.h,
                                  list: CustomSingleSelector(
                                    onConfirm: provider.onSelectVacationType,
                                    list: provider.vacationTypes,
                                    initialValue:
                                        provider.selectedVacationType?.id,
                                  ),
                                  onConfirm: () => CustomNavigator.pop()),
                              valid: (v) => Validations.required(
                                  v,
                                  getTranslated(
                                      "select_vacation_type", context)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Row(
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
                                            getTranslated(
                                                "start_date", context),
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
                                            getTranslated("end_date", context),
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
                                            valueChanged:
                                                provider.onSelectEndDate,
                                            label:
                                                getTranslated("to", context)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: (provider.startDate != null &&
                                  provider.endDate != null),
                              child: CustomTextFormField(
                                pAssetIcon: Images.calenderIcon,
                                controller: TextEditingController(
                                    text: provider.duration),
                                sufWidget: Text(
                                  getTranslated("day", context),
                                  style: AppTextStyles.w500.copyWith(
                                    fontSize: 13,
                                    color: Styles.hintColor,
                                  ),
                                ),
                                read: true,
                              ),
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
