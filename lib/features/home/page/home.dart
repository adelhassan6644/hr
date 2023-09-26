import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/home/widget/check_in_card.dart';
import 'package:hr_project/features/home/widget/home_app_bar.dart';
import 'package:hr_project/features/home/widget/type_card.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../data/config/di.dart';
import '../../../main_page/provider/dashboard_provider.dart';
import '../../../navigation/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT),
      child: Column(
        children: [
          const HomeAppBar(),

          const CheckInCard(),

          ///attendance_leaving
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: TypeCard(
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
          TypeCard(
            icon: Image.asset(
              Images.salaries,
              height: 25,
              color: const Color(0xff8fc44b),
            ),
            title: getTranslated("salary_&_financial", context),
            iconColor: const Color(0xff8fc44b),
            onTap: () => CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL),

            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SalariesScreen()));},
          ),
          //  SizedBox(height: 20.h),
          //  TypeCard(
          //   icon: const Icon(Icons.flag,
          //       color: Color(0xff9e0318), size: 25),
          //   title: getTranslated("holidays", context),
          //   iconColor: const Color(0xff9e0318),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const HolidaysScreen(),
          //     ));
          //   },
          // ),
        ],
      ),
    );
  }
}
