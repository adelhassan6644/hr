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
        return Right(response);
      } else {
        return left(ServerFailure(response.data['message']));
      }
    } catch (error) {
      return left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> confirmMail(
      {required String studentID, required String code}) async {
    try {
      Response response = await dioClient.post(
        uri: EndPoints.confirmMail,
          data: {"student_id": studentID, "code": code}
        );
      if (response.statusCode == 200) {
        return Right(response);
      }
      else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(e)));
    }
  }

  // Future<String> saveDeviceToken() async {
  //   String? _deviceToken = await FirebaseMessaging.instance.getToken();
  //   if (_deviceToken != null) {
  //     print('--------Device Token---------- ' + _deviceToken);
  //   }
  //   return _deviceToken ?? "";
  // }

  // for forgot password
  Future<Either<ServerFailure, Response>> forgetPassword(
      {required String email}) async {
    try {
      Response response = await dioClient
          .post(uri: EndPoints.forgetPassword, data: {"email": email});
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (error) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(error)));
    }
  }

  Future<Either<ServerFailure, Response>> reSendEmailConfirmation(
      {required String email}) async {
    try {
      Response response = await dioClient
          .post(data: {"email": email}, uri: EndPoints.resendConfirmationCode);
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(e)));
    }
  }

  Future<Either<ServerFailure, Response>> updatePassword(
      {required String email, required String password}) async {
    try {
      Response response =
          await dioClient.post(uri: EndPoints.updatePassword, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(ServerFailure(response.data["message"]));
      }
    } catch (e) {
      return Left(ServerFailure(ApiErrorHandler.getMessage(e.toString())));
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppStorageKey.userId);
    await sharedPreferences.remove(AppStorageKey.isLogin);
    return true;
  }
}
