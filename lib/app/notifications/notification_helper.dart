library notification_helper;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../data/config/di.dart';
import '../../features/forced_attendance_form/repo/forced_attendance_form_repo.dart';
import '../../features/notifications/provider/notifications_provider.dart';
import '../../navigation/custom_navigation.dart';
import '../../navigation/routes.dart';
@pragma('vm:entry-point')

part 'firebase_notification_helper.dart';
part 'notification_operation.dart';
part 'local_notification.dart';
