import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/base/confirm_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../app/core/utils/images.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../domain/localization/language_constant.dart';
import '../../base/animated_widget.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_button.dart';
import '../../base/custom_check_box_list_tile.dart';
import '../../base/custom_date_time_picker.dart';
import '../../base/custom_drop_down_button.dart';
import '../../base/custom_text_form_field.dart';
import '../../notifier/add_request_provider.dart';
import '../widgets/request_reason.dart';

class BusinessTripRequest extends StatefulWidget {
  const BusinessTripRequest({Key? key}) : super(key: key);

  @override
  State<BusinessTripRequest> createState() => _BusinessTripRequest();
}

class _BusinessTripRequest extends State<BusinessTripRequest> {
  late TextEditingController reason;
  late TextEditingController members;

  DateTime? startDate;
  DateTime? endDate;
  DateTime? returnDate;
  DateTime? departureDate;
  bool isFlight = false;

  List<String>services=["accommodation","transportation","food"];
  List<String>selectedService=[];

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
        title: getTranslated("business_trip_request", context),
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
                        getTranslated("business_trip_details", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                          color: ColorResources.PRIMARY
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
                              name: getTranslated("destination", context),
                              pIcon: Images.destination,
                              pIconColor: ColorResources.GOLD_COLOR);
                        }
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.services,
                      removePIcon: false,
                      read: true,
                      tIconColor: ColorResources.GOLD_COLOR,
                      hint: getTranslated("select_additional_services", context),
                      onTap: (){
                        setState(() {
                          CustomBottomSheet.show(label:  getTranslated("select_additional_services", context),
                              height: 0.35*context.height,
                              list:  CupertinoScrollbar(
                                thickness: 4.0,
                                thumbVisibility: true,
                                radius:  Radius.circular(12.w),
                                child: SizedBox(
                                  height: context.height*0.35,
                                  child: StatefulBuilder(
                                    builder: (context,reBuilder) {
                                      return Column(
                                        children: [
                                          ListView.builder(
                                              itemCount: services.length,
                                              shrinkWrap: true,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context,index) {
                                                return CustomCheckBoxListTile(
                                                  title:getTranslated(services[index], context),
                                                  value: selectedService.contains(services[index]),
                                                  onChange: (value){
                                                    reBuilder(() {
                                                      if(selectedService.contains(services[index])){
                                                        selectedService.remove(services[index]);
                                                      }else{
                                                        selectedService.add(services[index]);
                                                      }
                                                    });

                                                  },
                                                );
                                              }
                                          ),
                                        ],
                                      );
                                    }
                                  ),
                                ),
                              )
                          );
                        });
                       
                      },
                    ),
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
                                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Text(getTranslated("start_date", context),style: AppTextStyles.w500.copyWith(
                                    fontSize: 13,
                                    color: ColorResources.PRIMARY
                                ),),
                              ),
                              SizedBox(height: 8.h,),
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
                                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Text(getTranslated("end_date", context),style: AppTextStyles.w500.copyWith(
                                    fontSize: 13,
                                    color: ColorResources.PRIMARY
                                ),),
                              ),
                              SizedBox(height: 8.h,),
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
                              tIcon: Images.calenderIcon,
                              removePIcon: false,
                              sufWidget: Text(
                                getTranslated("day", context),
                                style: AppTextStyles.w500.copyWith(
                                  fontSize: 13,
                                  color: ColorResources.PRIMARY,
                                ),
                              ),
                              read: true,
                              tIconColor: ColorResources.GOLD_COLOR,
                              hint: "${getTranslated("business_trip_duration", context)}${"  :  "}${diffBtw2Dates(startDate: startDate??DateTime.now(), endDate: endDate??DateTime.now())}",
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
                        color: ColorResources.GOLD_COLOR.withOpacity(0.4),
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
                            color: ColorResources.PRIMARY
                          ),
                        ),
                        CupertinoSwitch(
                            activeColor: ColorResources.PRIMARY,
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
                                      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                      child: Text(getTranslated("departure_date", context),style: AppTextStyles.w500.copyWith(
                                          fontSize: 13,
                                          color: ColorResources.PRIMARY
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
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
                                      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                                      child: Text(getTranslated("return_date", context),style: AppTextStyles.w500.copyWith(
                                          fontSize: 13,
                                          color: ColorResources.PRIMARY
                                      ),),
                                    ),
                                    SizedBox(height: 8.h,),
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
                            tIcon: Images.members,
                            removePIcon: false,
                            type: TextInputType.number,
                            sufWidget: Text(
                              getTranslated("member", context),
                              style: AppTextStyles.w400.copyWith(
                                fontSize: 12,
                                color: ColorResources.PRIMARY,
                              ),
                            ),
                            valid: (v){
                              if(v!= null || int.parse(v!.toString()) > 4){
                                return null;
                              }else{
                                return "Must be less 4 member";
                              }
                            },
                            tIconColor: ColorResources.hintColor,
                            hint:getTranslated("members", context) ,
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

String diffBtw2Dates({required DateTime startDate,required DateTime endDate, }) {

  var dur = endDate.toLocal().difference(startDate);
  return dur.inDays.toString();

}