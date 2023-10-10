import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yusrPlus/main_repos/base_repo.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class NotificationsRepo extends BaseRepo {
  NotificationsRepo(
      {required super.dioClient, required super.sharedPreferences});

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }

  Future<Either<ServerFailure, Response>> getNotifications() async {
    try {
      Response response =
          await dioClient.get(uri: EndPoints.getNotifications(userId));
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> readNotification(id) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.readNotification(userId, id));
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> deleteNotification(id) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.deleteNotification(userId, id));
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
