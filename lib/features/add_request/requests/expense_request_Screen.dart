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
import '../../../components/custom_text_form_field.dart';
import '../provider/add_request_provider.dart';
import '../widgets/request_reason.dart';

class ExpenseRequestScreen extends StatefulWidget {
  const ExpenseRequestScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseRequestScreen> createState() => _ExpenseRequestScreenState();
}

class _ExpenseRequestScreenState extends State<ExpenseRequestScreen> {
  late TextEditingController itemName;
  late TextEditingController reason;
  late TextEditingController expenseAmount;
  late TextEditingController description;
  DateTime? date;

  @override
  void initState() {
    itemName = TextEditingController();
    reason = TextEditingController();
    expenseAmount = TextEditingController();
    description = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("expense_claim_request", context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [
              /// The Expense Claim Details
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
                        getTranslated("items", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      // tIcon: Images.expenses,
                      // removePIcon: false,
                      // sIcon: Images.question,
                      controller: description,
                      // tIconColor: Styles.hintColor,
                      hint: getTranslated("item_name", context),
                      onChanged: (String? value) {},
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      // tIcon: Images.cash,
                      // removePIcon: false,
                      // sIcon: Images.question,
                      sufWidget: Text(
                        getTranslated("sar", context),
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 12,
                          color: Styles.hintColor,
                        ),
                      ),
                      controller: expenseAmount,
                      // tIconColor: Styles.hintColor,
                      hint: getTranslated("amount", context),
                      onChanged: (String? value) {},
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      // tIcon: Images.description,
                      // removePIcon: false,
                      // sIcon: Images.question,
                      controller: description,
                      // tIconColor: Styles.hintColor,
                      hint: getTranslated("description", context),
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomSelectDate(
                        valueChanged: (value) {
                          date = value;
                        },
                        label: getTranslated("date", context))
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
              Consumer<AddRequestProvider>(
                  builder: (context, addRequestProvider, child) {
                return CustomButton(
                    textColor: Styles.WHITE,
                    text: getTranslated("submit", context),
                    onTap: () => addRequestProvider.onSubmit(),
                    backgroundColor: Styles.PRIMARY_COLOR);
              })
            ],
          ),
        ),
      ),
    );
  }
}
