import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_date_time_picker.dart';
import '../../../components/custom_drop_down_button.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("request_loan", context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [
              /// The Loan Details
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                        color: Styles.BORDER_COLOR,
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
                        getTranslated("loan_details", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Consumer<AddRequestProvider>(builder: (context,addRequestProvider,child)  {
                        return CustomDropDownButton(
                            items: addRequestProvider.loanTypes,
                            onChange:addRequestProvider.onSelectLoanType,
                            name: getTranslated("loan_type", context),
                            // pIcon: Images.salaryIcon,
                            pIconColor: Styles.hintColor);
                      }
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      // tIcon: Images.cash,
                      // removePIcon: false,
                      // sIcon: Images.question,
                      // type: TextInputType.number,
                      sufWidget: Text(
                        getTranslated("sar", context),
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 12,
                          color: Styles.hintColor,
                        ),
                      ),
                      controller: loanAmount,
                      // tIconColor: Styles.hintColor,
                      hint: getTranslated("loan_amount", context),
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSelectDate(
                        valueChanged: (value) {
                          installmentStartDate = value;
                        },
                        label: getTranslated("installment_start_date", context))
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              ///  Calculating mechanism of the proposed installment
              StatefulBuilder(builder: (context, reBuilder) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                          color: Styles.BORDER_COLOR,
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
                          getTranslated(
                              "calculating_mechanism_of_the_proposed_installment",
                              context),
                          style: AppTextStyles.w600.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomDropDownButton(
                          items: [
                            getTranslated(
                                "specified_number_of_months", context),
                            getTranslated(
                                "A_specified_monthly_amount", context),
                          ],
                          name: getTranslated("monthly_installment", context),
                          // pIcon: Images.cash,
                          pIconColor: Styles.hintColor,
                          onChange: (Object? value) {
                            reBuilder(() {
                              selectedMechanism = value;
                              amount.clear();
                              numberOfMonths.clear();
                            });
                          }),
                      SizedBox(
                        height: 16.h,
                      ),
                      Visibility(
                          visible: selectedMechanism != null,
                          child: Column(
                            children: [
                              if (selectedMechanism ==
                                  getTranslated(
                                      "specified_number_of_months", context))
                                CustomTextFormField(
                                  // tIcon: Images.calenderIcon,
                                  controller: numberOfMonths,
                                  // removePIcon: false,
                                  // type: TextInputType.number,
                                  // tIconColor: Styles.hintColor,
                                  hint: getTranslated(
                                      "number_of_months", context),
                                  label: true,
                                ),
                              if (selectedMechanism ==
                                  getTranslated(
                                      "A_specified_monthly_amount", context))
                                CustomTextFormField(
                                  // tIcon: Images.cash,
                                  // removePIcon: false,
                                  controller: amount,
                                  // type: TextInputType.number,
                                  sufWidget: Text(
                                    getTranslated("sar", context),
                                    style: AppTextStyles.w500.copyWith(
                                      fontSize: 12,
                                      color: Styles.hintColor,
                                    ),
                                  ),
                                  // tIconColor: Styles.hintColor,
                                  hint: getTranslated("amount", context),
                                  label: true,
                                ),
                              if (amount.text.isNotEmpty &&
                                  loanAmount.text.isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    CustomTextFormField(
                                      // tIcon: Images.calenderIcon,
                                      // removePIcon: false,
                                      read: true,
                                      sufWidget: Text(
                                        getTranslated("month", context),
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 12,
                                          color: Styles.hintColor,
                                        ),
                                      ),
                                      // tIconColor: Styles.hintColor,
                                      hint: "${getTranslated("number_of_months", context)}${"  :  "}${(int.parse(loanAmount.text.trim().toString().convertDigits()) ~/ int.parse(amount.text.trim().toString().convertDigits())).roundToDouble()}",
                                    ),
                                  ],
                                ),
                              if (numberOfMonths.text.isNotEmpty &&
                                  loanAmount.text.isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    CustomTextFormField(
                                      // tIcon: Images.cash,
                                      // removePIcon: false,
                                      read: true,
                                      // type: TextInputType.number,
                                      sufWidget: Text(
                                        getTranslated("sar", context),
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 12,
                                          color: Styles.hintColor,
                                        ),
                                      ),
                                      // tIconColor: Styles.hintColor,
                                      hint:
                                          "${getTranslated("monthly_installment", context)}${" :  "}${(int.parse(loanAmount.text.trim().toString().convertDigits()) ~/ int.parse(numberOfMonths.text.trim().toString().convertDigits())).roundToDouble()}",
                                    ),
                                  ],
                                ),
                            ],
                          ))
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 25.h,
              ),

              /// The Request Reason
               RequestReason( reasonController: reason),
              SizedBox(
                height: 25.h,
              ),

              Consumer<AddRequestProvider>(builder: (context,addRequestProvider,child)  {
                  return CustomButton(textColor: Styles.WHITE, text: getTranslated("submit", context),
                      onTap:()=>addRequestProvider.onSubmit() ,
                      backgroundColor: Styles.PRIMARY_COLOR);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}