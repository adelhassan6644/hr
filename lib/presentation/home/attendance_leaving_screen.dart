import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../navigation/custom_navigation.dart';
import '../calender/src/customization/calendar_style.dart';
import '../calender/src/shared/utils.dart';
import '../calender/src/table_calendar.dart';
import '../notifier/attendance_schedules_provider.dart';
import 'widget/attendance_card.dart';

class AttendanceLeavingScreen extends StatefulWidget {
  const AttendanceLeavingScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceLeavingScreen> createState() => _AttendanceLeavingScreen();
}

class _AttendanceLeavingScreen extends State<AttendanceLeavingScreen> {






  @override
  void initState() {

    Future.delayed(Duration.zero,(){
      Provider.of<AttendanceScheduleProvider>(context,listen: false).init();
    });
    super.initState();
  }




  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;

  @override
  void dispose() {
    Provider.of<AttendanceScheduleProvider>(context,listen: false).selectedEvents.dispose();
    super.dispose();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("attendance_leaving", context),
        // showLeading: true,
        // titleCenter: true,
      ),
      body: Consumer<AttendanceScheduleProvider>(
        builder: (context,notifier,_) {
          if(!notifier.isLoading) {
            return Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.h),
            child: Column(
              children: [

                TableCalendar<Event>(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: notifier.focusedDay,
                  selectedDayPredicate: (day) => isSameDay(notifier.currentDay, day),

                  calendarFormat: _calendarFormat,
                  eventLoader: notifier .getEventsForDay,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  calendarStyle: CalendarStyle(

                    outsideDaysVisible: true,
                    selectedDecoration:  const BoxDecoration(color:ColorResources.PRIMARY,shape: BoxShape.circle ),
                      markerDecoration: const BoxDecoration(color:ColorResources.PRIMARY,shape: BoxShape.circle ),
                    rangeHighlightColor: Theme.of(context).primaryColor
                  ),
                  onDaySelected: notifier .onDaySelected,
                  weekendDays: const [DateTime.friday, DateTime.thursday],


                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    notifier .focusedDay = focusedDay;
                  },
                ).animate().flip().slide().then(delay:10.ms).shimmer(),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                    valueListenable: notifier.selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return   AttendanceCard(event: value[index],);

                        },
                      );
                    },
                  ),
                ),

              ],
            ),
          );
          }
          else return SizedBox();
        }
      ),
    );
  }

}
