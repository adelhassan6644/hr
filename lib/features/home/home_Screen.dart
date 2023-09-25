import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/home/widget/check_in_card.dart';
import 'package:hr_project/features/home/widget/type_card.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import '../../app/core/constant.dart';
import '../../app/core/dimensions.dart';
import '../../app/core/images.dart';
import '../../app/localization/localization/language_constant.dart';
import '../../navigation/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
             SizedBox(height: 10.h),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.FILL),
                        child: const ClipOval(
                            child:
                            // profileImage == null ?
                            Icon(
                              Icons.person,
                              color: Styles.disabledColor,
                            )
                          // : Image.file(profileImage!, fit: BoxFit.cover,),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Software Cloud 2", style: titleTextStyle),
                          Center(
                              child: Text("Manager", style: hintTextStyle)),
                        ],
                      ),
                    ],
                  ).animate().flip().then(delay:10.ms).shimmer(),
                ),
                IconButton(
                  icon: Image.asset(
                    Images.notification,
                    color: Styles.PRIMARY_COLOR,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
             SizedBox(height: 30.h),
            CheckInCard(),

             SizedBox(height: 40.h),
             TypeCard(
              icon: const Icon(
                Icons.fingerprint,
                color: Styles.PRIMARY_COLOR,
              ),
              title: getTranslated("attendance_leaving", context),
              iconColor: Styles.PRIMARY_COLOR,
              onTap: () =>CustomNavigator.push(Routes.ATTENDANCE_LEAVING),
            ),
             SizedBox(height: 20.h),
             TypeCard(
                icon: Image.asset(
                  Images.salaries,
                  height: 25,
                  color: const Color(0xff8fc44b),
                ),
                title: getTranslated("salary_&_financial", context),
                iconColor: const Color(0xff8fc44b),
               onTap: () =>CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL),


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
      ),
    );
  }
}