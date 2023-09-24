import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/api/end_points.dart';
import '../../../data/dio/dio_client.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class ConfigRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ConfigRepo({required this.dioClient, required this.sharedPreferences});

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
