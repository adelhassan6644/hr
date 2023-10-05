import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/core/text_styles.dart';
import '../../../components/custom_images.dart';
import '../../../data/config/di.dart';
import '../model/notifications_model.dart';
import '../provider/notifications_provider.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({
    Key? key,
    this.notification,
    this.withBorder = true,
  }) : super(key: key);
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
            customImageIconSVG(
              imageName: SvgImages.notifications,
              height: 25,
              width: 25,
              color: Colors.black,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:Text(widget.notification?.notificationBody?.title ?? "",
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.w600
                            .copyWith(fontSize: 16, color: widget.notification?.isRead == true
                            ? Styles.disabledColor
                            : Styles.SUBTITLE)),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                      widget.notification?.createdAt?.format("EEE dd/mm") ?? "",
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
