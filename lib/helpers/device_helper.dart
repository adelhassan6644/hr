import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';

abstract class DeviceHelper {
  static Future<String> getDeviceInfo() async {
    String deviceIdentifier = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      final WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      deviceIdentifier = webInfo.vendor! +
          webInfo.userAgent! +
          webInfo.hardwareConcurrency.toString();
    } else {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceIdentifier = androidInfo.id;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceIdentifier = iosInfo.identifierForVendor!;
      } else if (Platform.isLinux) {
        final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
        deviceIdentifier = linuxInfo.machineId!;
      }
    }
    return deviceIdentifier;
  }
}
