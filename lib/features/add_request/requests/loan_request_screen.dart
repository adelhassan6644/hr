import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
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
import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/add_request_provider.dart';
import '../widgets/request_reason.dart';

class LoanRequestScreen extends StatefulWidget {
  const LoanRequestScreen({Key? key}) : super(key: key);

  @override
  State<LoanRequestScreen> createState() => _LoanRequestScreenState();
}

class _LoanRequestScreenState extends State<LoanRequestScreen> {
  late TextEditingController amount;
  late TextEditingController reason;
  late TextEditingController loanAmount;
  late TextEditingController numberOfMonths;
  DateTime? installmentStartDate;
  Object? selectedMechanism;

  @override
  void initState() {
    numberOfMonths = TextEditingController();
    reason = TextEditingController();
    loanAmount = TextEditingController();
    amount = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: getTranslated("request_loan", context)),
        body: Column(
          children: [
            Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  /// The Loan Details
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: CustomExpansionTile(
                      title: getTranslated("loan_details", context),
                      children: [
                        Consumer<AddRequestProvider>(
                            builder: (context, addRequestProvider, child) {
                          return CustomDropDownButton(
                              items: addRequestProvider.loanTypes,
                              onChange: addRequestProvider.onSelectLoanType,
                              name: getTranslated("loan_type", context),
                              pAssetIcon: Images.salaryIcon,
                              pIconColor: Styles.hintColor);
                        }),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:16.h),
                          child: CustomTextFormField(
                            pAssetIcon: Images.cash,
                            inputType: TextInputType.number,
                            sufWidget: Text(
                              getTranslated("sar", context),
                              style: AppTextStyles.w500.copyWith(
                                fontSize: 12,
                                color: Styles.hintColor,
                              ),
                            ),
                            controller: loanAmount,
                            hint: getTranslated("loan_amount", context),
                            label: true,
                          ),
                        ),

                        CustomSelectDate(
                            valueChanged: (value) {
                              installmentStartDate = value;
                              setState(() {});
                            },
                            startDateTime: installmentStartDate,
                            label: getTranslated(
                                "installment_start_date", context))
                      ],
                    ),
                  ),

                  ///  Calculating mechanism of the proposed installment
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: CustomExpansionTile(
                      title: getTranslated(
                          "calculating_mechanism_of_the_proposed_installment",
                          context),
                      children: [
                        StatefulBuilder(builder: (context, reBuilder) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropDownButton(
                                  items: [
                                    getTranslated(
                                        "specified_number_of_months", context),
                                    getTranslated(
                                        "A_specified_monthly_amount", context),
                                  ],
                                  name: getTranslated(
                                      "monthly_installment", context),
                                  // pIcon: Images.cash,
                                  pIconColor: Styles.hintColor,
                                  onChange: (Object? value) {
                                    reBuilder(() {
                                      selectedMechanism = value;
                                      amount.clear();
                                      numberOfMonths.clear();
                                    });
                                  }),
                              Visibility(
                                  visible: selectedMechanism != null,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Column(
                                      children: [
                                        Visibility(
                                          visible: (selectedMechanism ==
                                              getTranslated(
                                                  "specified_number_of_months",
                                                  context)),
                                          child: CustomTextFormField(
                                            pAssetIcon: Images.calenderIcon,
                                            controller: numberOfMonths,
                                            inputType: TextInputType.number,
                                            hint: getTranslated(
                                                "number_of_months", context),
                                            label: true,
                                          ),
                                        ),
                                        Visibility(
                                          visible: (selectedMechanism ==
                                              getTranslated(
                                                  "A_specified_monthly_amount",
                                                  context)),
                                          child: CustomTextFormField(
                                            pAssetIcon: Images.cash,
                                            controller: amount,
                                            inputType: TextInputType.number,
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
                                        Visibility(
                                          visible: (amount.text.isNotEmpty &&
                                              loanAmount.text.isNotEmpty),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 16.h),
                                            child: CustomTextFormField(
                                              pAssetIcon: Images.calenderIcon,
                                              read: true,
                                              sufWidget: Text(
                                                getTranslated("month", context),
                                                style:
                                                    AppTextStyles.w500.copyWith(
                                                  fontSize: 12,
                                                  color: Styles.hintColor,
                                                ),
                                              ),
                                              hint:
                                                  "${getTranslated("number_of_months", context)}${"  :  "}${((int.tryParse(loanAmount.text.trim()) ?? 1) ~/ (int.tryParse(amount.text.trim()) ?? 1)).roundToDouble()}",
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              (numberOfMonths.text.isNotEmpty &&
                                                  loanAmount.text.isNotEmpty),
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 16.h),
                                            child: CustomTextFormField(
                                              pAssetIcon: Images.cash,
                                              read: true,
                                              inputType: TextInputType.number,
                                              sufWidget: Text(
                                                getTranslated("sar", context),
                                                style:
                                                    AppTextStyles.w500.copyWith(
                                                  fontSize: 12,
                                                  color: Styles.hintColor,
                                                ),
                                              ),
                                              // tIconColor: Styles.hintColor,
                                              hint:
                                                  "${getTranslated("monthly_installment", context)}${" :  "}${((int.tryParse(loanAmount.text.trim()) ?? 1) ~/ (int.tryParse(numberOfMonths.text.trim()) ?? 1)).roundToDouble()}",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          );
                        }),
                      ],
                    ),
                  ),

                  /// The Request Reason
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: RequestReason(reasonController: reason),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
          ),
          child: Consumer<AddRequestProvider>(
              builder: (context, addRequestProvider, child) {
            return CustomButton(
              text: getTranslated("submit", context),
              onTap: () => addRequestProvider.onSubmit(),
            );
          }),
        ),
      ),
    );
  }
}
