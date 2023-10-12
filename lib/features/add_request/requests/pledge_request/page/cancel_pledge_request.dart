import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../../../app/core/validation.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_bottom_sheet.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_expansion_tile.dart';
import '../../../../../components/custom_single_selector.dart';
import '../../../../../components/custom_text_form_field.dart';
import '../../../../../data/config/di.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../../../../../navigation/custom_navigation.dart';
import '../../../../covenant/provider/covenant_provider.dart';
import '../../../widgets/request_reason.dart';
import '../provider/pledge_request_provider.dart';
import '../repo/pledge_request_repo.dart';

class CancelPledgeRequest extends StatefulWidget {
  const CancelPledgeRequest({Key? key}) : super(key: key);

  @override
  State<CancelPledgeRequest> createState() => _CancelPledgeRequestState();
}

class _CancelPledgeRequestState extends State<CancelPledgeRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () => sl<CovenantProvider>().getCovenant());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => PledgeRequestProvider(repo: sl<PledgeRequestRepo>()),
        child: Consumer<PledgeRequestProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(
                title: getTranslated("pledge_release_request", context)),
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
                        /// The Asset Details
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: CustomExpansionTile(
                            title: getTranslated(
                                "pledge_release_details", context),
                            children: [
                              Consumer<CovenantProvider>(
                                  builder: (_, covenantProvider, child) {
                                return CustomTextFormField(
                                  sufWidget: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Styles.disabledColor,
                                    size: 18,
                                  ),
                                  controller: TextEditingController(
                                      text: provider.selectedType?.name ?? ""),
                                  hint: getTranslated(
                                      "pledge_release_type", context),
                                  read: true,
                                  onTap: () {
                                    if (covenantProvider.isLoading) {
                                      CustomSnackBar.showSnackBar(
                                          notification: AppNotification(
                                              message: getTranslated(
                                                  "please_wait", context),
                                              isFloating: true,
                                              backgroundColor: Styles.PENDING,
                                              borderColor: Colors.transparent));
                                    } else if (!covenantProvider.isLoading &&
                                        covenantProvider.covenant.isEmpty) {
                                      CustomSnackBar.showSnackBar(
                                          notification: AppNotification(
                                              message: getTranslated(
                                                  "there_is_no_covenant",
                                                  context),
                                              isFloating: true,
                                              backgroundColor: Styles.PENDING,
                                              borderColor: Colors.transparent));
                                    } else {
                                      CustomBottomSheet.show(
                                          label: getTranslated(
                                              "pledge_release_type", context),
                                          height: 400.h,
                                          list: CustomSingleSelector(
                                            onConfirm:
                                                provider.onSelectLoanType,
                                            list: covenantProvider.covenant
                                                .map((e) => CustomSelectModel(
                                                      id: e.id,
                                                      name: e.name,
                                                employeePledgeId:e.employeePledgeId
                                                    ))
                                                .toList(),
                                            initialValue:
                                                provider.selectedType?.id,
                                          ),
                                          onConfirm: () =>
                                              CustomNavigator.pop());
                                    }
                                  },
                                  valid: (v) => Validations.required(
                                      v,
                                      getTranslated(
                                          "select_pledge_type", context)),
                                );
                              }),
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
                isLoading: provider.isLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    provider.onSubmit(isCancel: true);
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
