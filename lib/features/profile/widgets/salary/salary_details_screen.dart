import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../../app/core/color_resources.dart';
import '../../../../app/core/constant.dart';
import '../../../../app/core/dimensions.dart';
import '../../../../app/localization/localization/language_constant.dart';
import '../../../../components/custom_app_bar.dart';

class SalaryDetailsScreen extends StatelessWidget {
  const SalaryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("salary_details", context),
      ),
      body: Column(
        children: [
          Container(
            width: context.width,
            height: context.height * 0.25,
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            decoration: const BoxDecoration(
              color: ColorResources.PRIMARY,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(getTranslated("salary_revealed", context),
                    style: headLineTextStyle.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateTime.now().monthFormat(),
                  style: const TextStyle(
                      fontSize: 18,
                      color: ColorResources.WHITE,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  getTranslated("pay_by", context),
                  style: const TextStyle(
                      fontSize: 14,
                      color: ColorResources.WHITE,
                      fontWeight: FontWeight.w600),
                ),

              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: const BoxDecoration(
                    color: ColorResources.FILL,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(
                                "total_salary_and_allowances", context),
                            style: const TextStyle(
                                fontSize: 16,
                                color: ColorResources.PRIMARY,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "5675.8 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          color: ColorResources.disabledColor,
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated("base_salary", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.disabledColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "5675.8 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated("health_insurance", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.disabledColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "56 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated("family_allowance", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.disabledColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "675 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding:
                  const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: const BoxDecoration(
                    color: ColorResources.FILL,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(
                                "deductions", context),
                            style: const TextStyle(
                                fontSize: 16,
                                color: ColorResources.PRIMARY,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "5675.8 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          color: ColorResources.disabledColor,
                          height: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated("absence", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.disabledColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "56 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated("delay", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.disabledColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "675 ${getTranslated("sar", context)}",
                            style: const TextStyle(
                                fontSize: 14,
                                color: ColorResources.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      // TextButton(onPressed: (){}, child: Text(getTranslated("more_details", context),
                      // style: const TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w500,
                      //   color: ColorResources.primary
                      // ),),)
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
