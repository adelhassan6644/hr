import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/home/holidays_screen.dart';
import 'package:hr_project/presentation/home/my_vacations_screen.dart';
import 'package:hr_project/presentation/home/salaries_screen.dart';
import 'package:hr_project/presentation/home/attendance_leaving_screen.dart';
import 'package:hr_project/presentation/home/widget/type_card.dart';
import '../../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';
import 'expenses_screen.dart';

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
            SizedBox(height: MediaQuery.of(context).systemGestureInsets.top),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    Images.notification,
                    color: ColorResources.primary,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
                Row(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Software Cloud 2", style: titleTextStyle),
                            Center(
                                child: Text("Manager", style: hintTextStyle)),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          color: ColorResources.fillColor
                          ),
                          child: const ClipOval(
                              child:
                                  // profileImage == null ?
                                 Icon(Icons.person,color: ColorResources.disabledColor,)
                              // : Image.file(profileImage!, fit: BoxFit.cover,),
                              ),
                        ),
                      ],
                    ),
                  ],)
              ],),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorResources.fillColor),
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
                  hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ColorResources.primary.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.fingerprint,
                                color: ColorResources.primary,
                                size: 40,
                              ),
                              Text(
                                getTranslated("check_now", context),
                                style: const TextStyle(
                                    color: ColorResources.primary,
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
            const SizedBox(height: 40),
            TypeCard(
              width: context.width,
              height: 70,
              icon: const Icon(
                Icons.fingerprint,
                color: ColorResources.primary,
              ),
              title: getTranslated("attendance_leaving", context),
              iconColor: ColorResources.primary,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder:  (context) => const AttendanceLeavingScreen(),));
              },
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                TypeCard(
                  width: context.width * 0.45,
                  height: 80,
                  icon: Image.asset(
                    Images.salaries,
                    height: 25,
                    color: const Color(0xff8fc44b),
                  ),
                  title: getTranslated("salaries", context),
                  iconColor: const Color(0xff8fc44b),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SalariesScreen()));},
                ),
                SizedBox(
                  width: context.width * 0.03,
                ),
                TypeCard(
                  height: 80,
                  width: context.width * 0.45,
                  icon: Image.asset(
                    Images.vacations,
                    height: 25,
                    color: const Color(0xfff6b854),
                  ),
                  title: getTranslated("my_vacations", context),
                  iconColor: const Color(0xfff6b854),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyVacationScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                TypeCard(
                  width: context.width * 0.45,
                  height: 80,
                  icon: const Icon(Icons.flag,
                      color: Color(0xff9e0318), size: 25),
                  title: getTranslated("holidays", context),
                  iconColor: const Color(0xff9e0318),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HolidaysScreen(),));

                  },
                ),
                SizedBox(
                  width: context.width * 0.03,
                ),
                TypeCard(
                  height: 80,
                  width: context.width * 0.45,
                  icon: Image.asset(
                    Images.expenses,
                    height: 25,
                    color: const Color(0xfff1cf6e),
                  ),
                  title: getTranslated("expenses", context),
                  iconColor: const Color(0xfff1cf6e),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExpensesScreen(),));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
