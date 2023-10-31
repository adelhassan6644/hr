part of 'notification_helper.dart';

scheduleNotification(String title, String subtitle, String data) async {
  var rng = math.Random();
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'channel_id',
    'your channel name',
    importance: Importance.high,
    priority: Priority.high,
    ticker: 'ticker',
    icon: '@mipmap/launcher_icon',
  );
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  await _notificationsPlugin!.show(
    rng.nextInt(100000),
    title,
    subtitle,
    platformChannelSpecifics,
    payload: data,
  );
}

void iOSPermission() {
  _firebaseMessaging!.requestPermission(
      alert: true, announcement: true, badge: true, sound: true);
}

void handlePath(Map dataMap) {
  updateUserFunctions(notify: dataMap);
  handlePathByRoute(dataMap);
}

updateUserFunctions({@required notify}) async {
  Future.delayed(Duration.zero, () {
    sl<NotificationsProvider>().getNotifications();
    if (notify["type"] == "check" &&
        !sl<ForcedAttendanceFormRepo>().isInPage()) {
      CustomNavigator.push(Routes.FORCED_ATTENDANCE_FORM,
          arguments: int.parse(notify["id"].toString()));
    }
  });
}

Future<void> handlePathByRoute(Map notify) async {
  if (notify["type"] == "check" && !sl<ForcedAttendanceFormRepo>().isInPage()) {
    CustomNavigator.push(Routes.FORCED_ATTENDANCE_FORM,
        arguments: int.parse(notify["id"].toString()));
  } else if (notify["type"] != "check") {
    CustomNavigator.push(Routes.NOTIFICATIONS);
  }
}
