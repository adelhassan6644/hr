import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/home/widget/type_card.dart';
import '../../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';
import '../../navigation/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
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
                            color: ColorResources.FILL),
                        child: const ClipOval(
                            child:
                            // profileImage == null ?
                            Icon(
                              Icons.person,
                              color: ColorResources.disabledColor,
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
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    Images.notification,
                    color: ColorResources.PRIMARY,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
             SizedBox(height: 30.h),
             Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorResources.FILL),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTime.now().dataMainFormat(),
                        style: const TextStyle(
                            color: ColorResources.disabledColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        DateTime.now().dayFormat(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslated(
                                  "check_in_attendance_leaving", context),
                              style: const TextStyle(
                                  color: ColorResources.hintColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                DateTime.now().timeFormat(),
                                style: const TextStyle(
                                    color: ColorResources.blackColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              getTranslated("Checked_in_at", context),
                              style: const TextStyle(
                                  color: ColorResources.hintColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ColorResources.PRIMARY.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.fingerprint,
                                color: ColorResources.PRIMARY,
                                size: 40,
                              ),
                              Text(
                                getTranslated("check_now", context),
                                style: const TextStyle(
                                    color: ColorResources.PRIMARY,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
             SizedBox(height: 40.h),
             TypeCard(
              icon: const Icon(
                Icons.fingerprint,
                color: ColorResources.PRIMARY,
              ),
              title: getTranslated("attendance_leaving", context),
              iconColor: ColorResources.PRIMARY,
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
