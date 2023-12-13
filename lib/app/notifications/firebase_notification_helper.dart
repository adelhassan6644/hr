part of 'notification_helper.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as FireStore,
  // make sure you call initializeApp before using other Firebase services.
  await Firebase.initializeApp();
  log('on Message background notification ${message.data}');
  log('on Message background data ${message.notification?.body}');
  log("Handling a background message: ${message.notification!.toMap()}");
  if (Platform.isAndroid) {
    scheduleNotification(message.notification!.title ?? "",
        message.notification!.body ?? "", json.encode(message.data));
  }
  updateUserFunctions(notify: message.data);
}


FirebaseMessaging? _firebaseMessaging;

class FirebaseNotifications {
  static FirebaseNotifications? _instance;

  FirebaseNotifications._internal();

  factory FirebaseNotifications() {
    _instance ??= FirebaseNotifications._internal();
    return _instance!;
  }

  static Future<void> setUpFirebase() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging!.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    localNotification();
    firebaseCloudMessagingListeners();
  }

  static Future<void> firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) iOSPermission();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage data) {
        log('on Message notification ${data.notification?.toMap()}');
        log('on Message data ${data.data}');
        log('on Message body ${data.notification?.body}');
        Map notify = data.data;
        log("$notify");
        if (Platform.isAndroid) {
          scheduleNotification(data.notification!.title ?? "",
              data.notification!.body ?? "", json.encode(notify));
        }
        updateUserFunctions(notify: notify);
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
      log('on Opened ${data.data}');
      Map notify = data.data;
      handlePath(notify);
    });

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      log("Data from initial message >>>>>> ${value?.data}");
    });

    _notificationsPlugin!.getActiveNotifications().then((value) {
      if (value.isNotEmpty) {
        log('on Opened From ActiveNotifications ${value[0].payload}');
        if (value[0].payload != null && value[0].payload != "") {
          handlePath(
            json.decode(value[0].payload!),
          );
        }
      }
    });

    _notificationsPlugin!
        .getNotificationAppLaunchDetails()
        .then((NotificationAppLaunchDetails? data) {
      log('on Opened From Notification ${json.decode(json.encode(data!.notificationResponse?.payload.toString()))}');
      if (data.notificationResponse?.payload != null &&
          data.notificationResponse?.payload != "") {
        handlePath(json.decode(data.notificationResponse?.payload ?? ""));
      }
    });
  }
}
