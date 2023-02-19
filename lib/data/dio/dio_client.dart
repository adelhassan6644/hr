import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../app/core/api/end_points.dart';
import 'api_clinet.dart';
import 'logging_interceptor.dart';

class DioClient extends ApiClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  // final SharedPreferences sharedPreferences;

  final Dio dio;

  String? token;

  DioClient(
    this.baseUrl, {
    required this.dio,
    required this.loggingInterceptor,
    // required this.sharedPreferences,
  }) {
    // token = sharedPreferences.getString(AppStorageKey.token);
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": " application/json",
        'X-Api-Key': EndPoints.apiKey
      };
    dio.interceptors.add(loggingInterceptor);
  }

  @override
  Future<Response> get({
    required String uri,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(uri, queryParameters: queryParameters);
      log(response.toString());

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw e;
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
      log(uri);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw e;
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
      log(uri);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw e;
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
      throw e;
    }
  }
}
