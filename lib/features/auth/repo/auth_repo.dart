import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yusrPlus/helpers/device_helper.dart';
import 'package:yusrPlus/main_repos/base_repo.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../data/api/end_points.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';

class AuthRepo extends BaseRepo {
  AuthRepo({required super.sharedPreferences, required super.dioClient});

  bool firstTimeOnApp() {
    return sharedPreferences.containsKey(AppStorageKey.firstTimeOnApp);
  }

  firstTimeCompleted() async {
    await sharedPreferences.setBool(AppStorageKey.firstTimeOnApp, true);
  }

  Future<String?> saveDeviceToken() async {
    String? deviceToken;
    if (Platform.isIOS) {
      deviceToken = await FirebaseMessaging.instance.getAPNSToken();
    } else {
      deviceToken = await FirebaseMessaging.instance.getToken();
    }

    if (deviceToken != null) {
      log('--------Device Token---------- $deviceToken');
    }
    return deviceToken;
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }

  setLoggedIn() {
    sharedPreferences.setBool(AppStorageKey.isLogin, true);
  }

  updateHeader(id, token) async {
    await dioClient.updateHeader(id, token);
  }

  Future<Either<ServerFailure, Response>> logIn(
      {required String email, required String password}) async {
    try {
      Response response = await dioClient.post(uri: EndPoints.login, data: {
        "email": email,
        "password": password,
        "fcm_token": await saveDeviceToken(),
        "mac_id": await DeviceHelper.getDeviceInfo(),
      });
      if (response.statusCode == 200) {
        await updateHeader(
          response.data['data']['employee']['id'].toString(),
          response.data['data']['token'],
        );
        await saveUser(response.data['data']['employee'], response.data['data']['token']);
        await setLoggedIn();
        return Right(response);
      } else {
        return left(ServerFailure(
            ApiErrorHandler.getMessage(response.data['message'])));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  saveUser(dynamic jsonData,token) async {
    try {
      await sharedPreferences.setString(
        AppStorageKey.userKey,
        jsonEncode(jsonData),
      );

      ///To Save User id
      await sharedPreferences.setString(
        AppStorageKey.userID,
        jsonData['id'].toString(),
      );

      ///To Save token
      await sharedPreferences.setString(
        AppStorageKey.token,
        token,
      );
    } catch (error) {
      return ServerFailure(ApiErrorHandler.getMessage(error));
    }
  }

  Future<Either<ServerFailure, Response>> forgetPassword(
      {required String mail}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.forgetPassword, data: {
        "email": mail,
      });

      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }  Future<Either<ServerFailure, Response>> logOut(
     ) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.logOut, );

      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> resendCode(
      {required String mail}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.forgetPassword, data: {
        "email": mail,
      });

      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> verifyMail(
      {required String mail,
      required String code,
      bool updateHeader = false}) async {
    try {
      Response response = await dioClient.post(
          uri: EndPoints.checkMailForResetPassword,
          data: {"code": code, "email": mail});
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> reset(
      {required String password, required String email}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.resetPassword, data: {
        "email": email,
        "newPassword": password,
      });

      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> change(
      {required String oldPassword, required String password}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.changePassword(userId), data: {
        "oldPassword": oldPassword,
        "newPassword": password,
      });

      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppStorageKey.userKey);
    await sharedPreferences.remove(AppStorageKey.isLogin);
    return true;
  }
}
