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
import '../../../../../navigation/custom_navigation.dart';
import '../../../widgets/request_reason.dart';
import '../provider/asset_request_provider.dart';
import '../repo/asset_request_repo.dart';

class AssetRequest extends StatefulWidget {
  const AssetRequest({Key? key}) : super(key: key);

  @override
  State<AssetRequest> createState() => _AssetRequestState();
}

class _AssetRequestState extends State<AssetRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => AssetRequestProvider(repo: sl<AssetRequestRepo>()),
        child:
            Consumer<AssetRequestProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar:
                CustomAppBar(title: getTranslated("covenant_request", context)),
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
                            title: getTranslated("covenant_details", context),
                            children: [
                              CustomTextFormField(
                                sufWidget: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Styles.disabledColor,
                                  size: 18,
                                ),
                                controller: TextEditingController(
                                    text:
                                        provider.selectedAssetType?.name ?? ""),
                                hint: getTranslated("covenant_type", context),
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
                                                "there_is_no_covenant",
                                                context),
                                            isFloating: true,
                                            backgroundColor: Styles.PENDING,
                                            borderColor: Colors.transparent));
                                  } else {
                                    CustomBottomSheet.show(
                                        label: getTranslated(
                                            "covenant_type", context),
                                        height: 400.h,
                                        list: CustomSingleSelector(
                                          onConfirm: provider.onSelectLoanType,
                                          list: provider.types,
                                          initialValue:
                                              provider.selectedAssetType?.id,
                                        ),
                                        onConfirm: () => CustomNavigator.pop());
                                  }
                                },
                                valid: (v) => Validations.required(
                                    v,
                                    getTranslated(
                                        "select_covenant_type", context)),
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
                isLoading: provider.isLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    provider.onSubmit();
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
