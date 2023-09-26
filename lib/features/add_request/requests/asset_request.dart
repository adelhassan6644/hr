import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_drop_down_button.dart';
import '../provider/add_request_provider.dart';
import '../widgets/request_reason.dart';

class AssetRequest extends StatefulWidget {
  const AssetRequest({Key? key}) : super(key: key);

  @override
  State<AssetRequest> createState() => _AssetRequestState();
}

class _AssetRequestState extends State<AssetRequest> {
  late TextEditingController reason;


  @override
  void initState() {
    reason = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("asset_request", context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [

              /// The Letter Details
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
                        getTranslated("asset_details", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Consumer<AddRequestProvider>(
                        builder: (context, addRequestProvider, child) {
                          return CustomDropDownButton(
                              items: addRequestProvider.loanTypes,
                              onChange: addRequestProvider.onSelectLoanType,
                              name: getTranslated("asset_type", context),
                              // pIcon: Images.assetsIcon,
                              pIconColor: Styles.hintColor);
                        }
                    ),
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

              ///Submit
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
