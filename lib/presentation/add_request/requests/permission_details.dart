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
import '../../base/custom_drop_down_button.dart';
import '../../notifier/add_request_provider.dart';
import '../widgets/request_reason.dart';

class PermissionRequestScreen extends StatefulWidget {
  const PermissionRequestScreen({Key? key}) : super(key: key);

  @override
  State<PermissionRequestScreen> createState() => _PermissionRequestScreenState();
}

class _PermissionRequestScreenState extends State<PermissionRequestScreen> {

  late TextEditingController reason;

  DateTime? date;

  @override
  void initState() {
    reason = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("permission_request", context),
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
                        color: ColorResources.GOLD_COLOR.withOpacity(0.4),
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
                        getTranslated("permission_details", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                          color: ColorResources.PRIMARY
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
                          name: getTranslated("type", context),
                          pIcon: Images.time,
                          pIconColor: ColorResources.hintColor);
                    }
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
