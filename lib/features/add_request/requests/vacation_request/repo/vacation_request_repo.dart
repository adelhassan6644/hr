import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../data/api/end_points.dart';
import '../../../../../data/error/api_error_handler.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_repos/base_repo.dart';

class VacationRequestRepo extends BaseRepo {
  VacationRequestRepo(
      {required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> sendVacationRequest(body) async {
    try {
      Response response = await dioClient.post(
          uri: EndPoints.vacationRequest, data: FormData.fromMap(body));
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

  Future<Either<ServerFailure, Response>> getTypes() async {
    try {
      Response response = await dioClient.get(uri: EndPoints.vacationTypes);
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
