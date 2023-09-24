import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../data/dio/dio_client.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../../../data/model/user_model.dart';

class ProfileRepo {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;
  ProfileRepo({required this.sharedPreferences, required this.dioClient});

  Future<Either<ServerFailure, UserModel>> getUser() async {
    try {
      final String? userObject =
          sharedPreferences.getString(AppStorageKey.userKey);
      if (userObject != null) {
        final userJson = jsonDecode(userObject);
        UserModel user = UserModel.fromJson(userJson);
        return Right(user);
      } else {
        return Left(ServerFailure("There is no data in SharedPreference"));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }
}
