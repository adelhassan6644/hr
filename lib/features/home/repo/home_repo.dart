import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import '../../../data/api/end_points.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../../../main_repos/base_repo.dart';
import '../../attendance/model/schedules_model.dart';

class HomeRepo extends BaseRepo {
  HomeRepo({required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> checkOnSchedule() async {
    try {
      Response response =
          await dioClient.get(uri: EndPoints.checkOnSchedule(userId));
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

  Future<Either<ServerFailure, Response>> checkIn(
      {required ScheduleModel scheduleModel, required bool isAttend}) async {
    try {


      final position = await getCurrentPosition();
      Response response = await dioClient.post(
          uri: isAttend
              ? EndPoints.checkLeave(scheduleModel.attendanceId)
              : EndPoints.checkAttend(userId),
          data: {
            "schedule_id":scheduleModel.scheduleId,
            "lat": position.latitude,
            "long": position.longitude
          }
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

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }
}
