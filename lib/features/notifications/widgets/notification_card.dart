import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../components/custom_images.dart';
import '../../../data/config/di.dart';
import '../../../main_page/provider/dashboard_provider.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../model/notifications_model.dart';
import '../provider/notifications_provider.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard(
      {super.key, this.notification, this.withBorder = true});
  final NotificationItem? notification;
  final bool withBorder;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (widget.notification?.isRead != true) {
          sl<NotificationsProvider>()
              .readNotification(widget.notification?.id ?? 0);
          setState(() => widget.notification?.isRead = true);
        }
        if (widget.notification?.notificationBody?.checkAttendanceId != null) {
          CustomNavigator.push(Routes.FORCED_ATTENDANCE_FORM,
              arguments: int.parse(
                  (widget.notification?.notificationBody?.checkAttendanceId ??
                          "")
                      .toString()));
        } else {
          sl<DashboardProvider>().updateDashboardIndex(1);
          CustomNavigator.pop();
        }
      },
      child: Container(
        width: context.width,
        padding:
            EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL.h),
        decoration: BoxDecoration(
            border: widget.withBorder
                ? const Border(
                    bottom: BorderSide(color: Styles.BORDER_COLOR, width: 1))
                : null),
        child: Row(
          children: [
            customImageIcon(
              imageName: Images.notification,
              height: 25,
              width: 25,
              color: Styles.PRIMARY_COLOR,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.notification?.notificationBody?.title ?? "fgrtg5g",
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.w600.copyWith(
                          fontSize: 16,
                          color: widget.notification?.isRead == true
                              ? Styles.disabledColor
                              : Styles.SUBTITLE)),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                      widget.notification?.createdAt?.format("EEE dd/mm") ??
                          "g5",
                      style: AppTextStyles.w400
                          .copyWith(fontSize: 14, color: Styles.disabledColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
