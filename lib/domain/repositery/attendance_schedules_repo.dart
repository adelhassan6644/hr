import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hr_project/domain/repositery/base_repo.dart';
import '../../data/api/end_points.dart';
import '../../../app/core/error/api_error_handler.dart';
import '../../../app/core/error/failures.dart';


class AttendanceSchedulesRepo extends BaseRepo {
  AttendanceSchedulesRepo({required super.sharedPreferences, required super.dioClient});


  Future<Either<ServerFailure, Response>> getAttendanceSchedules() async {
    try {
      Response response = await dioClient.get(
          uri: "${EndPoints.attendEmployeeSchedule}${currentUserID()}",
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


}
