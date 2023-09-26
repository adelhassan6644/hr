import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/core/app_storage_keys.dart';
import '../data/error/api_error_handler.dart';
import '../data/error/failures.dart';
import '../data/model/user_model.dart';

class UserRepo {
  final SharedPreferences sharedPreferences;
  UserRepo({required this.sharedPreferences});

  bool isLogIn() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }


  Future<Either<ServerFailure, UserModel>> getUser() async {
    try {
      final String? userObject =
          sharedPreferences.getString(AppStorageKey.userKey);
      if (userObject != null) {
        final userJson = jsonDecode(userObject);
        return Right(UserModel.fromJson(userJson));
      } else {
        return Left(ServerFailure("There is no data in SharedPreference"));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }
}
