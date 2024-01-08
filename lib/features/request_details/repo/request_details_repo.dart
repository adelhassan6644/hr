import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yusrPlus/main_repos/base_repo.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class RequestDetailsRepo extends BaseRepo {
  RequestDetailsRepo({required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> getRequestDetails(id) async {
    try {
      Response response = await dioClient.get(
        uri: EndPoints.requestDetails(id),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(ApiErrorHandler.getMessage(response.data['message'])));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }
}
