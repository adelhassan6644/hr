import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/core/api/app_interceptors.dart';
import '../../app/core/api/end_points.dart';
import 'api_clinet.dart';

class DioClient extends ApiClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  // final SharedPreferences sharedPreferences;

  final Dio _dio;

  String? _token;

  DioClient(
    this.baseUrl, {
    required Dio dio,
    required this.loggingInterceptor,
    // required this.sharedPreferences,
  }) : _dio = dio {
    // token = sharedPreferences.getString(AppStorageKey.token);
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 60.seconds
      ..options.receiveTimeout = 60.seconds
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": " application/json",
        'X-Api-Key': EndPoints.apiKey
      };
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 150,
    ),);
  }

  @override
  Future<Response> get({
    required String uri,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(uri, queryParameters: queryParameters);
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
      var response = await _dio.post(
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
      var response = await _dio.put(
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
      var response = await _dio.delete(
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
