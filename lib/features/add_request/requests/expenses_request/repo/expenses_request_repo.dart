import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../data/api/end_points.dart';
import '../../../../../data/error/api_error_handler.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_repos/base_repo.dart';

class ExpensesRequestRepo extends BaseRepo {
  ExpensesRequestRepo(
      {required super.sharedPreferences, required super.dioClient});

  Future<Either<ServerFailure, Response>> sendExpensesRequest(body) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.loanRequest, data: body);
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
