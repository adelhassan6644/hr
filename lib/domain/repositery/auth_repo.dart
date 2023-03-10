import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/core/api/end_points.dart';
import '../../app/core/error/api_error_handler.dart';
import '../../app/core/error/failures.dart';
import '../../app/core/utils/app_storage_keys.dart';
import '../../data/dio/dio_client.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;
  AuthRepo({required this.sharedPreferences, required this.dioClient});

  bool firstTimeOnApp() {
    return sharedPreferences.containsKey(AppStorageKey.firstTimeOnApp);
  }

  firstTimeCompleted() async {
    await sharedPreferences.setBool(AppStorageKey.firstTimeOnApp, true);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }

  setLoggedIn() {
    sharedPreferences.setBool(AppStorageKey.isLogin, true);
  }


  Future<Either<ServerFailure, Response>> logIn(
      {required String email, required String password}) async {
    try {
      Response response = await dioClient.post(
          uri: EndPoints.login, data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        await saveUser(response.data['data']['employee']);
        await setLoggedIn();
        return Right(response);
      } else {
        return left(ServerFailure(ApiErrorHandler.getMessage(response.data['message'])));
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
    } catch (error) {
      return ServerFailure(ApiErrorHandler.getMessage(error));
    }
  }


  Future<Either<ServerFailure, Response>> getVerificationCode(
      {required String email}) async {
    try {
      Response response = await dioClient
          .post(uri: EndPoints.getVerificationCode, data: {"email": email});
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(ApiErrorHandler.getMessage(response.data["message"])));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> sendVerificationCode(
      {required String code}) async {
    try {
      Response response = await dioClient
          .post(uri: EndPoints.sendVerificationCode, data: {"code": code});
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(ApiErrorHandler.getMessage(response.data["message"])));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> resetPassword(
      {required String newPassword ,}) async {
    try {
      Response response = await dioClient
          .post(uri: EndPoints.resetPassword, data: {"new_password": newPassword,});
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(ApiErrorHandler.getMessage(response.data["message"])));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> updatePassword(
      {required String email, required String password,required String newPassword}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.updatePassword, data: {
        "email": email,
        "password": password,
        "new_password": newPassword,
      });
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(ApiErrorHandler.getMessage(response.data["message"])));
      }
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(e.toString())));
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppStorageKey.userKey);
    await sharedPreferences.remove(AppStorageKey.isLogin);
    return true;
  }
}
