import 'dart:io';

import 'package:dio/dio.dart';

final _networkExpection = Exception("Network Error Or Internet Failure.");

class CoreDioInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final bool socketException = (err.error is SocketException);

    if (socketException) {
      handler.reject(_networkError(err));
    } else {
      handler.reject(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  DioException _dioError(Response response) {
    return DioException(
      requestOptions: response.requestOptions,
      response: response,
      error: response.data,
    );
  }

  DioException _networkError(DioException err) {
    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: _networkExpection,
    );
  }
}
