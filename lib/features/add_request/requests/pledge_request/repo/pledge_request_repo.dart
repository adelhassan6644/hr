import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../data/api/end_points.dart';
import '../../../../../data/error/api_error_handler.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_repos/base_repo.dart';

class PledgeRequestRepo extends BaseRepo {
  PledgeRequestRepo(
      {required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> sendPledgeRequest(body,
      {required bool isCancel}) async {
    try {
      Response response = await dioClient.post(
          uri: isCancel
              ? EndPoints.cancelPledgeRequest
              : EndPoints.pledgeRequest,
          data: FormData.fromMap(body));
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

  Future<Either<ServerFailure, Response>> deletePledge(id) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.deletePledgeRequest(id));
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
      Response response = await dioClient.get(uri: EndPoints.covenantTypes);
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
