import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../data/network/netwok_info.dart';

abstract class DeviceHelper {
  static Future<String> getDeviceIdentifier() async {
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

  static Future<String?> getWifiGatewayIP() async {


    final info= NetworkInfo();

  return await info.getWifiBroadcast();

  }
  static Future<String?> getWifiIP() async {


  return await  Ipify.ipv4();

  }

  static Future<IosDeviceInfo?> getDeviceInfoIos() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo? deviceIdentifier;
    if (Platform.isIOS) {
      deviceIdentifier = await deviceInfo.iosInfo;
    }

    return deviceIdentifier;
  }

  static Future<AndroidDeviceInfo?> getDeviceInfoAndroid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo? deviceIdentifier;
    if (Platform.isAndroid) {
      deviceIdentifier = await deviceInfo.androidInfo;
    }

    return deviceIdentifier;
  }
}
