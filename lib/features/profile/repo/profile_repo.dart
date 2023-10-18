import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yusrPlus/main_repos/base_repo.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class ProfileRepo extends BaseRepo {
  ProfileRepo({required super.sharedPreferences, required super.dioClient});


  Future<Either<ServerFailure, Response>> getProfile(
      ) async {
    try {
      Response response = await dioClient.get(
          uri: EndPoints.profile(userId), );
      if (response.statusCode == 200) {
        await saveUser(response.data['data']['employee']);

        return Right(response);
      } else {
        return left(ServerFailure(
            ApiErrorHandler.getMessage(response.data['message'])));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  saveUser(dynamic jsonData) async {
    try {
      await sharedPreferences.setString(
        AppStorageKey.userKey,
        jsonEncode(jsonData),
      );

      await sharedPreferences.setString(
        AppStorageKey.userID,
        jsonData['id'].toString(),
      );
    } catch (error) {
      return ServerFailure(ApiErrorHandler.getMessage(error));
    }
  }


  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppStorageKey.userKey);
    await sharedPreferences.remove(AppStorageKey.isLogin);
    return true;
  }
}
