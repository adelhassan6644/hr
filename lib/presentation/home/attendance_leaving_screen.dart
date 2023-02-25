import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import '../../navigation/custom_navigation.dart';
import '../calender/src/customization/calendar_style.dart';
import '../calender/src/shared/utils.dart';
import '../calender/src/table_calendar.dart';
import 'widget/attendance_card.dart';

class AttendanceLeavingScreen extends StatefulWidget {
  const AttendanceLeavingScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceLeavingScreen> createState() => _AttendanceLeavingScreen();
}

class _AttendanceLeavingScreen extends State<AttendanceLeavingScreen> {

  late TabController _tabController;
  final int _selectedIndex = 1;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longPress a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  @override
  void initState() {
    _tabController = TabController(
        length:3,
        initialIndex: _selectedIndex,
        vsync: CustomNavigator.scaffoldState.currentState!);
    _onDaySelected(DateTime.now(),DateTime.now());
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

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
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
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: CalendarStyle(

                outsideDaysVisible: true,
                selectedDecoration:  const BoxDecoration(color:ColorResources.PRIMARY,shape: BoxShape.circle ),
                  markerDecoration: const BoxDecoration(color:ColorResources.PRIMARY,shape: BoxShape.circle ),
                rangeHighlightColor: Theme.of(context).primaryColor
              ),
              onDaySelected: _onDaySelected,
              weekendDays: const [DateTime.friday, DateTime.thursday],


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
            ).animate().flip().slide().then(delay:10.ms).shimmer(),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
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
      ),
    );
  }

}
