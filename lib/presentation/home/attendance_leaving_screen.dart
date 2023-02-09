import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/calender/src/shared/utils.dart';
import 'package:hr_project/presentation/calender/src/table_calendar.dart';

import '../../navigation/custom_navigation.dart';
import '../calender/src/customization/calendar_style.dart';
import 'widget/attendance_card.dart';

class AttendanceLeavingScreen extends StatefulWidget {
  const AttendanceLeavingScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceLeavingScreen> createState() => _AttendanceLeavingScreen();
}

class _AttendanceLeavingScreen extends State<AttendanceLeavingScreen> {
  late TabController _tabController;
  int _selectedIndex = 1;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  @override
  void initState() {
    _tabController = TabController(
        length: 3,
        initialIndex: _selectedIndex,
        vsync: CustomNavigator.scaffoldState.currentState!);
    super.initState();
  }

  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void dispose() {
    _tabController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
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
      body: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.h),
        child: Column(
          children: [

            TableCalendar<Event>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  outsideDaysVisible: true,
                  selectedDecoration: const BoxDecoration(
                      color: ColorResources.PRIMARY, shape: BoxShape.circle),
                  markerDecoration: const BoxDecoration(
                      color: ColorResources.PRIMARY, shape: BoxShape.circle),
                  rangeHighlightColor: Theme.of(context).primaryColor),
              onDaySelected: _onDaySelected,
              weekendDays: [DateTime.friday, DateTime.thursday],
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return AttendanceCard(
                        event: value[index],
                      );
                    },
                  );
                },
              ),
            ),
            /*    Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                      child: Column(
                        children: const [
                          AttendanceCard(statues: "متأخر"),
                          AttendanceCard(statues: "late"),
                        ],
                      )),
                  Center(
                      child: Column(
                        children: const [
                          AttendanceCard(statues: "متأخر"),
                          AttendanceCard(statues: "late"),
                        ],
                      )),
                  Center(
                      child: Column(
                        children: const [
                          AttendanceCard(statues: "متأخر"),
                          AttendanceCard(statues: "late"),
                        ],
                      )),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
