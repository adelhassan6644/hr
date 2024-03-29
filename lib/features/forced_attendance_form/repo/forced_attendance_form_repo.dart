import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../app/core/app_storage_keys.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../../../helpers/device_helper.dart';
import '../../../main_repos/base_repo.dart';

class ForcedAttendanceFormRepo extends BaseRepo {
  ForcedAttendanceFormRepo(
      {required super.sharedPreferences, required super.dioClient});

  bool isInPage() {
    return sharedPreferences.containsKey(AppStorageKey.inAttendanceForm);
  }

  setInPage() {
    sharedPreferences.setBool(AppStorageKey.inAttendanceForm, true);
  }

  setOutPage() {
    sharedPreferences.remove(AppStorageKey.inAttendanceForm);
  }

  Future<Either<ServerFailure, Response>> checkIn({
    required int id,
    required File image,
  }) async {
    try {
      final position = await getCurrentPosition();

      var body = {
        "employee_id": dioClient.userId,
        "check_attendance_id": id,
        "mac_id": await DeviceHelper.getDeviceIdentifier(),
        "image": MultipartFile.fromFileSync(image.path),
        "lat": position.latitude,
        "long": position.longitude,
      };
      Response response = await dioClient.post(
          uri: EndPoints.forcedCheckAttendance, data: FormData.fromMap(body));
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(
            ApiErrorHandler.getMessage(response.data['message'])));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }
}
