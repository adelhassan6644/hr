import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

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

class ClearAssetRequest extends StatefulWidget {
  const ClearAssetRequest({Key? key}) : super(key: key);

  @override
  State<ClearAssetRequest> createState() => _ClearAssetRequestState();
}

class _ClearAssetRequestState extends State<ClearAssetRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => AssetRequestProvider(repo: sl<AssetRequestRepo>()),
        child:
            Consumer<AssetRequestProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(
                title: getTranslated("covenant_release_request", context)),
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
                                "covenant_release_details", context),
                            children: [
                              CustomTextFormField(
                                sufWidget: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Styles.disabledColor,
                                  size: 18,
                                ),
                                controller: TextEditingController(
                                    text: provider.selectedAssetType?.title ??
                                        ""),
                                hint: getTranslated(
                                    "covenant_release_type", context),
                                read: true,
                                onTap: () => CustomBottomSheet.show(
                                    label: getTranslated(
                                        "covenant_release_type", context),
                                    height: 400.h,
                                    list: CustomSingleSelector(
                                      onConfirm: provider.onSelectLoanType,
                                      list: provider.assetTypes,
                                      initialValue:
                                          provider.selectedAssetType?.id,
                                    ),
                                    onConfirm: () => CustomNavigator.pop()),
                                valid: (v) => Validations.required(
                                    v,
                                    getTranslated(
                                        "select_covenant_release_type",
                                        context)),
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
      ),
    );
  }
}
