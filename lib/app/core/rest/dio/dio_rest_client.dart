import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:howabout_coffee/app/core/local_storage/local_storage.dart';
import 'package:howabout_coffee/app/core/rest/dio/interceptors/auth_interceptor.dart';

import '../../config/base_config.dart';
import 'dio.dart';

class DioRestClient implements RestClient {
  late AuthInterceptor _authInterceptor;

  final Dio _dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );

  static DioRestClient? _instance;

  DioRestClient._() {
    log('Start the DioRestClient instance');
  }

  static DioRestClient get instance {
    _instance ??= DioRestClient._();

    return _instance!;
  }

  init({required Env env, required LocalStorage storage}) {
    _dio.options = BaseOptions(
      baseUrl: env['base_url_backend'] ?? '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 60),
    );

    _authInterceptor = AuthInterceptor(env: env, storage: storage);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.patch(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioException dioError) {
    final response = dioError.response;

    throw RestClientException(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
  }

  @override
  DioRestClient auth<DioRestClient>() {
    if (!_dio.interceptors.contains(_authInterceptor)) {
      _dio.interceptors.add(_authInterceptor);
    }
    return this as DioRestClient;
  }

  @override
  DioRestClient unauth<DioRestClient>() {
    _dio.interceptors.remove(_authInterceptor);
    return this as DioRestClient;
  }
}
