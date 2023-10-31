import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../../../helpers/device_helper.dart';
import '../../../main_repos/base_repo.dart';

class ForcedAttendanceFormRepo extends BaseRepo {
  ForcedAttendanceFormRepo(
      {required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> checkIn({
    required int id,
    required File image,
  }) async {
    try {
      final position = await getCurrentPosition();

      var body = {
        "schedule_id": id,
        "image": MultipartFile.fromFileSync(image.path),
        "lat": position.latitude,
        "long": position.longitude,
        "mac_id": await DeviceHelper.getDeviceInfo(),
      };
      Response response = await dioClient.post(
          uri: EndPoints.checkAttend(userId), data: FormData.fromMap(body));
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
