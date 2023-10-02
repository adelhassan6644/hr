import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yusrPlus/main_repos/base_repo.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class ConfigRepo extends BaseRepo {
  ConfigRepo({required super.dioClient, required super.sharedPreferences});

  Future<Either<ServerFailure, Response>> getSetting() async {
    try {
      Response response = await dioClient.get(uri: EndPoints.setting);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> getContact() async {
    try {
      Response response = await dioClient.get(uri: EndPoints.contact);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }
}
