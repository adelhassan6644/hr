import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/end_points.dart';
import '../../app/core/error/api_error_handler.dart';
import '../../app/core/error/failures.dart';
import '../../data/dio/dio_client.dart';
import 'package:geolocator/geolocator.dart';

import 'base_repo.dart';

class AttendanceRepo extends BaseRepo {

  AttendanceRepo({required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> attendEmployee() async {
    try {
      final position = await getCurrentPosition();
      Response response = await dioClient.post(
          uri: "${EndPoints.attendEmployee}${currentUserID()}",
          data: {"lat": position.latitude, "long": position.longitude});
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
