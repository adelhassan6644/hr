import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/loader_view.dart';
import '../../../main_providers/download_provider.dart';
import '../../../navigation/routes.dart';
import '../provider/salary_provider.dart';
import '../widget/salary_details_card.dart';

class Salary extends StatelessWidget {
  const Salary({Key? key}) : super(key: key);

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
                                  lineWidth: 12.0,
                                  percent: 0.2,
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "10217.50",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Styles.blackColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        getTranslated("sar", context),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Styles.blackColor,
                                          fontWeight: FontWeight.w600,
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
                                  children: List.generate(
                                      provider.salaryModel?.salaryDetailsModel
                                              ?.length ??
                                          0,
                                      (index) => SalaryDetailsCard(
                                          salary: provider.salaryModel
                                              ?.salaryDetailsModel?[index])),
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
                                      DateTime.now().monthFormat(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Styles.blackColor,
                                          fontWeight: FontWeight.w600),
                                    ),

                                    ///Open Invoice
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.h,
                                          horizontal: Dimensions
                                              .PADDING_SIZE_DEFAULT.w),
                                      child: CustomButton(
                                        onTap: () => CustomNavigator.push(
                                            Routes.PDF,
                                            arguments: ""),
                                        text: getTranslated("details", context),
                                      ),
                                    ),
                                    ChangeNotifierProvider(
                                      create: (_) => DownloadProvider(),
                                      child: Consumer<DownloadProvider>(
                                          builder: (_, provider, child) {
                                        return CustomButton(
                                            textColor: Styles.PRIMARY_COLOR,
                                            text: getTranslated(
                                                "download", context),
                                            onTap: () async {
                                              if (!provider.downloaded) {
                                                provider.download(
                                                    "", "".split("/").last);
                                              }
                                            },
                                            isLoading: provider.isLoading,
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
}
