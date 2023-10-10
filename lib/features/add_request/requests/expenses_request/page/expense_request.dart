import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../app/core/color_resources.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../../../app/core/images.dart';
import '../../../../../app/core/text_styles.dart';
import '../../../../../app/core/validation.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_expansion_tile.dart';
import '../../../../../components/custom_text_form_field.dart';
import '../../../../../data/config/di.dart';
import '../../../widgets/request_reason.dart';
import '../provider/expenses_request_provider.dart';
import '../repo/expenses_request_repo.dart';

class ExpenseRequest extends StatefulWidget {
  const ExpenseRequest({Key? key}) : super(key: key);

  @override
  State<ExpenseRequest> createState() => _ExpenseRequestState();
}

class _ExpenseRequestState extends State<ExpenseRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => ExpensesRequestProvider(repo: sl<ExpensesRequestRepo>()),
        child: Consumer<ExpensesRequestProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: getTranslated("financial_compensation_request", context),
            ),
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
                            title: getTranslated("financial_details", context),
                            children: [
                              CustomTextFormField(
                                pAssetIcon: Images.expenses,
                                controller: provider.description,
                                hint: getTranslated("title", context),
                                label: true,
                                valid: (v) => Validations.required(
                                    v, getTranslated("enter_title", context)),
                                keyboardAction: TextInputAction.next,
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: CustomTextFormField(
                                  pAssetIcon: Images.description,
                                  controller: provider.description,
                                  hint: getTranslated("description", context),
                                  label: true,
                                  valid: (v) => Validations.required(
                                      v,
                                      getTranslated(
                                          "enter_description", context)),
                                  keyboardAction: TextInputAction.done,
                                ),
                              ),

                              CustomTextFormField(
                                pAssetIcon: Images.cash,
                                sufWidget: Text(
                                  getTranslated("sar", context),
                                  style: AppTextStyles.w500.copyWith(
                                    fontSize: 12,
                                    color: Styles.hintColor,
                                  ),
                                ),
                                inputType: TextInputType.number,
                                formatter: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                                controller: provider.amount,
                                hint: getTranslated("amount", context),
                                valid: (v) => Validations.required(
                                    v,
                                    getTranslated(
                                        "enter_financial_compensation_amount",
                                        context)),
                                keyboardAction: TextInputAction.next,
                              ),
                              // SizedBox(
                              //   height: 16.h,
                              // ),
                              // CustomSelectDate(
                              //     startDateTime: provider.date,
                              //     valueChanged: provider.onSelectDate,
                              //     label: getTranslated("date", context)),
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
                isLoading: provider.isLoading,
              ),
            ),
          );
        }),
      ),
    );
  }
}
