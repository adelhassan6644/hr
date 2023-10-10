import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/app_snack_bar.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/loader_view.dart';
import '../../../data/config/di.dart';
import '../../../main_providers/download_provider.dart';
import '../../../navigation/routes.dart';
import '../provider/salary_provider.dart';
import '../widget/salary_details_card.dart';

class Salary extends StatefulWidget {
  const Salary({Key? key}) : super(key: key);

  @override
  State<Salary> createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  void initState() {
    Future.delayed(
        Duration.zero, () => sl<SalaryProvider>().getSalaryDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("salary_&_financial", context),
        ),
        body: Consumer<SalaryProvider>(builder: (_, provider, child) {
          return provider.isLoading
              ? const LoaderView()
              : Column(
                  children: [
                    Expanded(
                      child: ListAnimator(
                        customPadding: EdgeInsets.symmetric(
                            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                        data: [
                          Container(
                            padding: const EdgeInsets.all(
                                Dimensions.PADDING_SIZE_DEFAULT),
                            decoration: const BoxDecoration(
                              color: Styles.FILL_COLOR,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 70.0,
                                  lineWidth: 15.0,
                                  percent: calcPercent(
                                      provider.salaryModel?.salary?.netSalary,
                                      provider.salaryModel?.salary?.salary),
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        provider.salaryModel?.salary?.salary ??
                                            "",
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 16,
                                          color: Styles.blackColor,
                                        ),
                                      ),
                                      Text(
                                        getTranslated("sar", context),
                                        style: AppTextStyles.w500.copyWith(
                                          fontSize: 16,
                                          color: Styles.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  progressColor: Styles.PRIMARY_COLOR,
                                  backgroundColor: Styles.GOLD_COLOR,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SalaryDetailsCard(
                                        isNet: true,
                                        name: getTranslated(
                                            "net_salary", context),
                                        amount: provider
                                            .salaryModel?.salary?.netSalary),
                                    ...List.generate(
                                        provider.salaryModel?.salaryDetailsModel
                                                ?.length ??
                                            0,
                                        (index) => SalaryDetailsCard(
                                            name: provider
                                                .salaryModel
                                                ?.salaryDetailsModel?[index]
                                                .name,
                                            amount: provider
                                                .salaryModel
                                                ?.salaryDetailsModel?[index]
                                                .amount))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(getTranslated("salary_details", context),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Container(
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                decoration: const BoxDecoration(
                                  color: Styles.FILL_COLOR,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.salaryModel?.salary?.date
                                              ?.monthFormat() ??
                                          "",
                                      style: AppTextStyles.w600.copyWith(
                                        fontSize: 14,
                                        color: Styles.blackColor,
                                      ),
                                    ),

                                    ///Open Invoice
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.h,
                                          horizontal: Dimensions
                                              .PADDING_SIZE_DEFAULT.w),
                                      child: CustomButton(
                                        onTap: ()
                                        {
                                          if (provider.salaryModel?.salary
                                              ?.url ==
                                              null) {
                                            showToast(getTranslated(
                                                "notـreleased", context));
                                            return;
                                          }
                                          CustomNavigator.push(Routes.PDF,
                                              arguments: provider.salaryModel
                                                      ?.salary?.url ??
                                                  "");
                                        },
                                        text: getTranslated("details", context),
                                      ),
                                    ),
                                    ChangeNotifierProvider(
                                      create: (_) => DownloadProvider(),
                                      child: Consumer<DownloadProvider>(builder:
                                          (_, downloadProvider, child) {
                                        return CustomButton(
                                            textColor: Styles.PRIMARY_COLOR,
                                            text: getTranslated(
                                                "download", context),
                                            onTap: () async {
                                              if (provider.salaryModel?.salary
                                                      ?.url ==
                                                  null) {
                                                showToast(getTranslated(
                                                    "notـreleased", context));
                                                return;
                                              }
                                              if (!downloadProvider
                                                  .downloaded) {
                                                downloadProvider.download(
                                                    provider.salaryModel?.salary
                                                            ?.url ??
                                                        "",
                                                    provider.salaryModel?.salary
                                                            ?.url ??
                                                        "".split("/").last);
                                              }
                                            },
                                            isLoading:
                                                downloadProvider.isLoading,
                                            lIconWidget: const Icon(
                                              Icons.download,
                                              color: Styles.PRIMARY_COLOR,
                                            ),
                                            backgroundColor: Styles.WHITE);
                                      }),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }

  double calcPercent(net, salary) {
    log("=====>$net");
    log("=====>$salary");
    return (int.parse(net ?? "1") / int.parse(salary ?? "1"));
  }
}
