import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/images.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../domain/localization/language_constant.dart';
import '../../base/animated_widget.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_button.dart';
import '../../base/custom_date_time_picker.dart';
import '../../base/custom_text_form_field.dart';
import '../../notifier/add_request_provider.dart';
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
                        color: ColorResources.BORDER_COLOR,
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
                      tIcon: Images.expenses,
                      removePIcon: false,
                      sIcon: Images.question,
                      controller: description,
                      tIconColor: ColorResources.hintColor,
                      hint: getTranslated("item_name", context),
                      onChanged: (String? value) {},
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.cash,
                      removePIcon: false,
                      sIcon: Images.question,
                      sufWidget: Text(
                        getTranslated("sar", context),
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 12,
                          color: ColorResources.hintColor,
                        ),
                      ),
                      controller: expenseAmount,
                      tIconColor: ColorResources.hintColor,
                      hint: getTranslated("amount", context),
                      onChanged: (String? value) {},
                      label: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.description,
                      removePIcon: false,
                      sIcon: Images.question,
                      controller: description,
                      tIconColor: ColorResources.hintColor,
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
                        textColor: ColorResources.WHITE,
                        text: getTranslated("submit", context),
                        onTap: () => addRequestProvider.onSubmit(),
                        backgroundColor: ColorResources.PRIMARY);
                  })
            ],
          ),
        ),
      ),
    );
  }
}