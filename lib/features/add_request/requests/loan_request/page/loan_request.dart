import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/validation.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../../../app/core/images.dart';
import '../../../../../app/core/text_styles.dart';
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
import '../../../widgets/request_reason.dart';
import '../provider/loan_request_provider.dart';
import '../repo/loan_request_repo.dart';

class LoanRequest extends StatefulWidget {
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => LoanRequestProvider(repo: sl<LoanRequestRepo>()),
        child:
            Consumer<LoanRequestProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(title: getTranslated("request_loan", context)),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: ListAnimator(
                      customPadding: EdgeInsets.symmetric(
                          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                      data: [
                        /// The Loan Details
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: CustomExpansionTile(
                            title: getTranslated("loan_details", context),
                            children: [
                              CustomTextFormField(
                                pAssetIcon: Images.salaryIcon,
                                sufWidget: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Styles.disabledColor,
                                  size: 18,
                                ),
                                controller: TextEditingController(
                                    text:
                                        provider.selectedLoanType?.name ?? ""),
                                hint: getTranslated("loan_type", context),
                                read: true,
                                onTap: () {
                                  if(provider.isGetting){
                                    CustomSnackBar.showSnackBar(
                                        notification: AppNotification(
                                            message: getTranslated("please_wait", context),
                                            isFloating: true,
                                            backgroundColor: Styles.PENDING,
                                            borderColor: Colors.transparent));
                                  }else if (!provider.isGetting && provider.loanTypes.isEmpty){
                                    CustomSnackBar.showSnackBar(
                                        notification: AppNotification(
                                            message: getTranslated("there_is_no_data", context),
                                            isFloating: true,
                                            backgroundColor: Styles.PENDING,
                                            borderColor: Colors.transparent));
                                  }
                                  else {
                                    CustomBottomSheet.show(
                                        label:
                                            getTranslated("loan_type", context),
                                        height: 400.h,
                                        list: CustomSingleSelector(
                                          onConfirm: provider.onSelectLoanType,
                                          list: provider.loanTypes,
                                          initialValue:
                                              provider.selectedLoanType?.id,
                                        ),
                                        onConfirm: () => CustomNavigator.pop());
                                  }
                                },
                                valid: (v) => Validations.required(v,
                                    getTranslated("select_loan_type", context)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: CustomTextFormField(
                                  pAssetIcon: Images.cash,
                                  inputType: TextInputType.number,
                                  formatter: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                  sufWidget: Text(
                                    getTranslated("sar", context),
                                    style: AppTextStyles.w500.copyWith(
                                      fontSize: 12,
                                      color: Styles.hintColor,
                                    ),
                                  ),
                                  controller: provider.loanAmount,
                                  hint: getTranslated("loan_amount", context),
                                  label: true,
                                  valid: (v) => Validations.required(
                                      v,
                                      getTranslated(
                                          "select_loan_amount", context)),
                                ),
                              ),
                              CustomSelectDate(
                                  valueChanged:
                                      provider.onSelectInstallmentStartDate,
                                  startDateTime: provider.installmentStartDate,
                                  label: getTranslated(
                                      "installment_start_date", context))
                            ],
                          ),
                        ),

                        ///Calculating mechanism of the proposed installment
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: CustomExpansionTile(
                            title: getTranslated(
                                "calculating_mechanism_of_the_proposed_installment",
                                context),
                            children: [
                              CustomTextFormField(
                                sufWidget: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Styles.disabledColor,
                                  size: 18,
                                ),
                                controller: TextEditingController(
                                    text: provider.selectedInstallmentMethods
                                            ?.name ??
                                        ""),
                                hint: getTranslated(
                                    "type_monthly_installment", context),
                                valid: (v) => Validations.required(
                                    v,
                                    getTranslated(
                                        "select_monthly_installment", context)),
                                read: true,
                                onTap: () {
                                  if (provider.loanAmount.text
                                      .trim()
                                      .isNotEmpty) {
                                    CustomBottomSheet.show(
                                        label: getTranslated(
                                            "type_monthly_installment",
                                            context),
                                        height: 400.h,
                                        list: CustomSingleSelector(
                                          onConfirm: provider
                                              .onSelectInstallmentMethods,
                                          list: provider.installmentMethods,
                                          initialValue: provider
                                              .selectedInstallmentMethods?.id,
                                        ),
                                        onConfirm: () => CustomNavigator.pop());
                                  } else {
                                    CustomSnackBar.showSnackBar(
                                        notification: AppNotification(
                                            message: getTranslated(
                                                "select_loan_amount", context),
                                            isFloating: true,
                                            backgroundColor: Styles.IN_ACTIVE,
                                            borderColor: Colors.transparent));
                                  }
                                },
                              ),
                              Visibility(
                                  visible:
                                      provider.selectedInstallmentMethods !=
                                          null,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Column(
                                      children: [
                                        Visibility(
                                          visible: provider
                                                  .selectedInstallmentMethods
                                                  ?.id ==
                                              1,
                                          child: CustomTextFormField(
                                            pAssetIcon: Images.calenderIcon,
                                            controller: provider.numberOfMonths,
                                            inputType: TextInputType.number,
                                            formatter: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                            hint: getTranslated(
                                                "number_of_months", context),
                                            label: true,
                                          ),
                                        ),
                                        Visibility(
                                          visible: provider
                                                  .selectedInstallmentMethods
                                                  ?.id ==
                                              2,
                                          child: CustomTextFormField(
                                            pAssetIcon: Images.cash,
                                            controller: provider.amountPerMounth,
                                            inputType: TextInputType.number,
                                            formatter: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                            sufWidget: Text(
                                              getTranslated("sar", context),
                                              style:
                                                  AppTextStyles.w500.copyWith(
                                                fontSize: 12,
                                                color: Styles.hintColor,
                                              ),
                                            ),
                                            hint: getTranslated(
                                                "amount", context),
                                            label: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
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
