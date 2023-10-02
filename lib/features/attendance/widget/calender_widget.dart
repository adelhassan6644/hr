import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../components/shimmer/custom_shimmer.dart';
import '../../../data/config/di.dart';
import '../../language/provider/localization_provider.dart';
import '../provider/attendance_provider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Consumer<AttendanceProvider>(builder: (_, provider, child) {
        return !provider.isLoading
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Styles.WHITE,
                    border: Border.all(color: Styles.LIGHT_BORDER_COLOR)),
                child: CalendarCarousel<Event>(
                  onCalendarChanged: (x) {
                    print(x);
                  },
                  onDayPressed: (date, events) {
                    provider.onDaySelected(
                      date,
                    );
                  },
                  selectedDateTime: provider.day,
                  selectedDayTextStyle: const TextStyle(
                      color: Styles.PRIMARY_COLOR, fontSize: 25),
                  selectedDayBorderColor: Colors.black12,
                  selectedDayButtonColor: Styles.PRIMARY_COLOR.withOpacity(0.2),
                  locale: sl<LocalizationProvider>().locale.languageCode,
                  headerMargin: EdgeInsets.symmetric(horizontal: 50.w),
                  weekendTextStyle: const TextStyle(
                    color: Styles.PRIMARY_COLOR,
                  ),
                  thisMonthDayBorderColor: Styles.LIGHT_BORDER_COLOR,
                  markedDatesMap: provider.eventList,
                  showIconBehindDayText: false,
                  markedDateShowIcon: true,
                  todayTextStyle: const TextStyle(
                    color: Styles.PRIMARY_COLOR,
                  ),
                  markedDateIconBuilder: (event) {
                    return event.icon ?? const Icon(Icons.add_alert_rounded);
                  },
                  minSelectedDate:
                      DateTime.now().subtract(const Duration(days: 360)),
                  maxSelectedDate:
                      DateTime.now().add(const Duration(days: 360)),
                  todayButtonColor: Styles.SACOUNDRY.withOpacity(.2),
                  markedDateMoreShowTotal: false,
                ),
              ).animate().flip().slide().then(delay: 10.ms).shimmer()
            : const _CalenderShimmer();
      }),
    );
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
