import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../data/api/end_points.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../../../main_repos/base_repo.dart';

class AttendanceRepo extends BaseRepo {
  AttendanceRepo({required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> getEmployeeSchedules() async {
    try {
      Response response = await dioClient.get(
        uri: EndPoints.employeeSchedule(userId),
      );
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

  Future<Either<ServerFailure, Response>> getDaySchedules(DateTime day) async {
    try {
      Response response = await dioClient.post(
          uri: EndPoints.daySchedules(userId),
          data: {"day": day.defaultFormat2()});
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
