import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../app/core/color_resources.dart';
import '../../../components/shimmer/custom_shimmer.dart';
import '../../../data/config/di.dart';
import '../provider/attendance_provider.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      sl<AttendanceProvider>().getEmployeeSchedule();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(builder: (_, provider, child) {
      return !provider.isLoading
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Styles.WHITE,
                  border: Border.all(color: Styles.LIGHT_BORDER_COLOR)),
              child: TableCalendar(
                  firstDay: provider.kFirstDay,
                  lastDay: provider.kLastDay,
                  headerStyle: const HeaderStyle(
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    headerPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    formatButtonVisible: false,
                  ),
                  focusedDay: provider.focusedDay,
                  selectedDayPredicate: (day) => isSameDay(provider.day, day),
                  calendarFormat: provider.calendarFormat,
                  // eventLoader: provider.loadSchedule,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, dynamic event) {
                    if (event.isNotEmpty) {
                      return Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: Styles.PRIMARY_COLOR.withOpacity(0.2),
                            shape: BoxShape.circle),
                      );
                    }
                    return null;
                  }),
                  calendarStyle: CalendarStyle(
                      outsideDaysVisible: true,
                      selectedDecoration: const BoxDecoration(
                          color: Styles.PRIMARY_COLOR, shape: BoxShape.circle),
                      markerDecoration: const BoxDecoration(
                          color: Styles.PRIMARY_COLOR, shape: BoxShape.circle),
                      rangeHighlightColor: Theme.of(context).primaryColor),
                  onDaySelected: (v1, v2) => provider.onDaySelected(v1, v2),
                  onFormatChanged: provider.onChangeFormat,
                  onPageChanged: (v) {
                    provider.focusedDay = v;
                  },
                  onCalendarCreated: (v) {
                    Future.delayed(const Duration(milliseconds: 10), () {
                      provider.onDaySelected(DateTime.now(), DateTime.now());
                    });
                  }),
            ).animate().flip().slide().then(delay: 10.ms).shimmer()
          : const _CalenderShimmer();
    });
  }
}

class _CalenderShimmer extends StatelessWidget {
  const _CalenderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmerContainer(
      width: context.width,
      height: 340,
      radius: 24,
    );
  }
}
