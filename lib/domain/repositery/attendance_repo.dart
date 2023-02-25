import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/dio/dio_client.dart';
import '../../navigation/custom_navigation.dart';
import '../../presentation/base/regular_location_permission.bottomsheet.dart';

class AttendanceRepo {

  final SharedPreferences sharedPreferences;
  final DioClient dioClient;
  AttendanceRepo({required this.sharedPreferences, required this.dioClient});
  Future<bool> handleLocationRequest() async {
    var status = await Permission.locationWhenInUse.status;
    //check if location permission is not granted
    if (!status.isGranted) {
      final requestResult = await showDialog(
        barrierDismissible: false,
        context: CustomNavigator.navigatorState.currentContext!,
        builder: (context) {
          return RegularLocationPermissionDialog();
        },
      );
      //check if dialog was accepted or not
      if (requestResult == null || (requestResult is bool && !requestResult)) {
        return false;
      }

      //
  else {
        permissionDeniedAlert();
      }

      if (status.isPermanentlyDenied) {
        //When the user previously rejected the permission and select never ask again
        //Open the screen of settings
        await openAppSettings();
      }
    }
    //location permission is granted
    else {

    }
    return true;
  }

  //
  void permissionDeniedAlert() async {
    //The user deny the permission
    await Fluttertoast.showToast(
      msg: "Permission denied",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

}