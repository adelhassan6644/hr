import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/core/app_storage_keys.dart';
import '../api/end_points.dart';
import 'api_client.dart';
import 'logging_interceptor.dart';

class DioClient extends ApiClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  final Dio dio;

  String get domain => sharedPreferences.getString(AppStorageKey.domain) ?? "";
  String get userId => sharedPreferences.getString(AppStorageKey.userID) ?? "";
  String get token => sharedPreferences.getString(AppStorageKey.token) ?? "";
  bool get isLogin => sharedPreferences.containsKey(AppStorageKey.isLogin);

  DioClient(
    this.baseUrl, {
    required this.dio,
    required this.loggingInterceptor,
    required this.sharedPreferences,
  }) {
    dio
      ..options.baseUrl = EndPoints.baseUrlSubDomain(domain)
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": " application/json",
        'X-Api-Key': EndPoints.apiKey,
        if (isLogin) 'Authorization': "Bearer $token",
        if (isLogin) 'user_id': userId,
      };
    dio.interceptors.add(PrettyDioLogger(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true));
  }

  updateHeader(id, token) {

    dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": " application/json",
      'Authorization': "Bearer $token",
    };
  }
  updateDomain( domain) {
    dio
      ..options.baseUrl = EndPoints.baseUrlSubDomain(domain)
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": " application/json",
        'X-Api-Key': EndPoints.apiKey,

      };

  }

  @override
  Future<Response> get({
    required String uri,
    bool useGoogleUri = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {

      var response = await dio.get(uri, queryParameters: queryParameters);

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(
      {required String uri,
      Map<String, dynamic>? queryParameters,
      data}) async {
    try {

      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future put(
      {required String uri,
      Map<String, dynamic>? queryParameters,
      data}) async {
    try {

      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(
      {required String uri,
      Map<String, dynamic>? queryParameters,
      data}) async {
    try {

      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
