import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../data/api/end_points.dart';
import '../../../../../data/error/api_error_handler.dart';
import '../../../../../data/error/failures.dart';
import '../../../main_repos/base_repo.dart';

class RequestsRepo extends BaseRepo {
  RequestsRepo({required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> getRequests() async {
    try {
      Response response =
          await dioClient.get(uri: EndPoints.request(userId));
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
