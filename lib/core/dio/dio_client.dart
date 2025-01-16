import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/core/dio/core_dio_interceptor.dart';
import 'package:weather_app/core/dio/dio_exception.dart';
import 'package:weather_app/core/dio/network_const.dart';

const BASEURL = "https://api.openweathermap.org/data/2.5/";

class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: BASEURL,
    connectTimeout: NetworkConst.connectionTimeout,
    receiveTimeout: NetworkConst.recieveTimeout,
    contentType: Headers.jsonContentType,
    validateStatus: (status) => true,
    responseType: ResponseType.json,
  );

  DioClient._privateConstructor();

  static DioClient? _instance;
  static DioClient get instance =>
      _instance ??= DioClient._privateConstructor();

  final Dio _dio = Dio(options)
    ..interceptors.addAll([
      CoreDioInterceptor(),
      PrettyDioLogger(requestBody: true),
    ]);

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      print(e);
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<Response> delete(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      print(e);
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<Response> post(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<Response> patch(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<Response<T>> postMultipartFile<T>(
    String uri, {
    required String? fileKey,
    required String? filePath,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final MultipartFile? multiPartFile = filePath != null
        ? await MultipartFile.fromFile(filePath,
            filename: filePath.split('/').last,
            contentType: DioMediaType("image", filePath.split('.').last))
        : null;
    return await _dio.post(
      uri,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        headers: {'Content-Type': 'multipart/form-data'},
        contentType: Headers.multipartFormDataContentType,
      ),
      data: FormData.fromMap(
        {
          if (body != null) ...body,
          if (fileKey != null) fileKey: multiPartFile ?? '',
        },
      ),
      queryParameters: queryParameters,
    );
  }
}
