import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_drop_down_button.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_date_time_picker.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/add_request_provider.dart';
import '../widgets/request_reason.dart';

class VacationRequest extends StatefulWidget {
  const VacationRequest({Key? key}) : super(key: key);

  @override
  State<VacationRequest> createState() => _VacationRequestState();
}

class _VacationRequestState extends State<VacationRequest> {
  late TextEditingController reason;
  late TextEditingController members;

  DateTime? startDate;
  DateTime? endDate;
  DateTime? returnDate;
  DateTime? departureDate;
  bool isFlight = false;

  @override
  void initState() {
    reason = TextEditingController();
    members = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("vacation_request", context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [
              /// The Vacation Details
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
                        getTranslated("vacation_details", context),
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
                          name: getTranslated("vacation_type", context),
                          // pIcon: Images.vacations,
                          pIconColor: Styles.hintColor);
                    }),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Text(
                                  getTranslated("start_date", context),
                                  style: AppTextStyles.w500.copyWith(
                                      fontSize: 13, color: Styles.SUBTITLE),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomSelectDate(
                                  format: "dd,MMM",
                                  valueChanged: (value) {
                                    setState(() {
                                      startDate = value;
                                    });
                                  },
                                  label: getTranslated("from", context)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Text(
                                  getTranslated("end_date", context),
                                  style: AppTextStyles.w500.copyWith(
                                      fontSize: 13, color: Styles.SUBTITLE),
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomSelectDate(
                                  format: "dd,MMM",
                                  valueChanged: (value) {
                                    setState(() {
                                      endDate = value;
                                    });
                                  },
                                  label: getTranslated("to", context)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                        visible: (startDate != null && endDate != null),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              // tIcon: Images.calenderIcon,
                              // removePIcon: false,
                              sufWidget: Text(
                                getTranslated("day", context),
                                style: AppTextStyles.w500.copyWith(
                                  fontSize: 13,
                                  color: Styles.hintColor,
                                ),
                              ),
                              read: true,
                              // tIconColor: Styles.hintColor,
                              hint:
                                  "${getTranslated("vacation_duration", context)}${"  :  "}${diffBtw2Dates(startDate: startDate ?? DateTime.now(), endDate: endDate ?? DateTime.now())}",
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              /// The Flight Details
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated("flight_ticket", context),
                          style: AppTextStyles.w600.copyWith(
                            fontSize: 16.0,
                          ),
                        ),
                        CupertinoSwitch(
                            activeColor: Styles.PRIMARY_COLOR,
                            value: isFlight,
                            onChanged: (value) {
                              setState(() {
                                isFlight = value;
                              });
                            })
                      ],
                    ),
                    Visibility(
                      visible: isFlight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w),
                                      child: Text(
                                        getTranslated(
                                            "departure_date", context),
                                        style: AppTextStyles.w500.copyWith(
                                            fontSize: 13,
                                            color: Styles.SUBTITLE),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    CustomSelectDate(
                                        format: "dd,MMM",
                                        valueChanged: (value) {
                                          setState(() {
                                            startDate = value;
                                          });
                                        },
                                        label: getTranslated("from", context)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w),
                                      child: Text(
                                        getTranslated("return_date", context),
                                        style: AppTextStyles.w500.copyWith(
                                            fontSize: 13,
                                            color: Styles.SUBTITLE),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    CustomSelectDate(
                                        format: "dd,MMM",
                                        valueChanged: (value) {
                                          setState(() {
                                            endDate = value;
                                          });
                                        },
                                        label: getTranslated("to", context)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            // tIcon: Images.members,
                            // removePIcon: false,
                            // type: TextInputType.number,
                            sufWidget: Text(
                              getTranslated("member", context),
                              style: AppTextStyles.w500.copyWith(
                                fontSize: 13,
                                color: Styles.hintColor,
                              ),
                            ),
                            valid: (v) {
                              if (v != null || int.parse(v!.toString()) > 4) {
                                return null;
                              } else {
                                return "Must be less 4 member";
                              }
                            },
                            // tIconColor: Styles.hintColor,
                            hint: getTranslated("members", context),
                            controller: members,
                            label: true,
                          ),
                        ],
                      ),
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

String diffBtw2Dates({
  required DateTime startDate,
  required DateTime endDate,
}) {
  var dur = endDate.toLocal().difference(startDate);
  return dur.inDays.toString();
}
