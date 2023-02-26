import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_project/app/core/utils/constant.dart';

import '../utils/app_strings.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.data}] => PATH: ${options.path}');


    options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log( 'RESPONSE[${response.data}]'
        );


    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log( 'ERROR[${err.response}] => PATH: ${err.requestOptions.path}');


    super.onError(err, handler);
  }
}
