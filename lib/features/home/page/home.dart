import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/features/home/widget/check_in_card.dart';
import 'package:yusrPlus/features/home/widget/home_app_bar.dart';
import 'package:yusrPlus/features/home/widget/home_card.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../data/config/di.dart';
import '../../../main_page/provider/dashboard_provider.dart';
import '../../../navigation/routes.dart';
import '../provider/home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      child: Column(
        children: [
          const HomeAppBar(),
          Expanded(
              child: RefreshIndicator(
                onRefresh: ()=>  Future.delayed(Duration.zero, () => sl<HomeProvider>().checkOnSchedule()),
                child: ListAnimator(
            data: [
                const CheckInCard(),

                ///Add Request
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: HomeCard(
                    icon: const Icon(
                      Icons.add,
                      color: Styles.PRIMARY_COLOR,
                    ),
                    title: getTranslated("add_request", context),
                    iconColor: Styles.PRIMARY_COLOR,
                    onTap: () => CustomNavigator.push(Routes.ADD_REQUEST),
                  ),
                ),

                ///attendance_leaving
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: HomeCard(
                    icon: const Icon(
                      Icons.fingerprint,
                      color: Styles.PRIMARY_COLOR,
                    ),
                    title: getTranslated("attendance_leaving", context),
                    iconColor: Styles.PRIMARY_COLOR,
                    onTap: () => sl<DashboardProvider>().updateDashboardIndex(2),
                  ),
                ),

                ///"salary_&_financial
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: HomeCard(
                    icon: Image.asset(
                      Images.salaries,
                      height: 25,
                      color: const Color(0xff8fc44b),
                    ),
                    title: getTranslated("salary_&_financial", context),
                    iconColor: const Color(0xff8fc44b),
                    onTap: () =>
                        CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL),

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SalariesScreen()));},
                  ),
                ),

                SizedBox(height: 80.h),
            ],
          ),
              ))
        ],
      ),
    );
  }
}
