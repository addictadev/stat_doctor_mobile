// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:stat_doctor/core/config/app_end_points.dart';
import 'package:stat_doctor/core/extensions/localization.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/network/network_service/error_helper.dart';
import 'package:stat_doctor/core/network/network_service/exceptions.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum ApiEnvironment {primary, shared, map}

class ApiBaseHelper {
  static String primaryBaseUrl = AppEndpoints.baseUrl;
  static String sharedBaseUrl = AppEndpoints.baseUrl;
  static String mapBaseUrl = AppEndpoints.baseUrl;

  static final BuildContext _context = sl<AppNavigator>().navigatorKey.currentContext!;

  static  final PrettyDioLogger _logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode,
  );

  
  static final ApiBaseHelper _instance = ApiBaseHelper._internal();
  final Map<ApiEnvironment, Dio> _dioInstances = {};

  factory ApiBaseHelper({Dio? dio, ApiEnvironment environment = ApiEnvironment.primary}) {
    if (dio != null) {_instance._dioInstances[environment] = dio;}
    else {_instance._initializeDio(environment);}
    return _instance;
  }

  ApiBaseHelper._internal();

  void _initializeDio(ApiEnvironment environment) {
    final baseUrl = _getBaseUrl(environment);
    _dioInstances[environment] = Dio(
      BaseOptions(baseUrl: baseUrl, headers: _defaultHeaders()),
    )..interceptors.add(_logger);
  }

  String _getBaseUrl(ApiEnvironment environment) => switch(environment) {
    ApiEnvironment.primary => primaryBaseUrl,
    ApiEnvironment.shared => sharedBaseUrl,
    ApiEnvironment.map => mapBaseUrl,
  };

  Dio getDio(ApiEnvironment environment) {
    if (!_dioInstances.containsKey(environment)) {_initializeDio(environment);}
    return _dioInstances[environment]!;
  }

  void updateLocaleInHeaders(String locale, {ApiEnvironment? environment}) {
    if (environment != null) {getDio(environment).options.headers['Accept-Language'] = locale;}
    else {for (var dio in _dioInstances.values) {dio.options.headers['Accept-Language'] = locale;}}
  }

  static Map<String, String> _defaultHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'app-type': 'client',
    'Accept-Language': sl<Storage>().getLang(),
  };

  Future<T> _performRequest<T>(Future<Response<T>> Function() request, {required ApiEnvironment environment, String? requestToken}) async {
    try {
      final dio = getDio(environment);
      String? token = sl<Storage>().getToken();
      if(token != null) {dio.options.headers['Authorization'] = 'Bearer $token';}
      if(requestToken != null) {dio.options.headers['preSignedToken'] = requestToken;}
      final response = await request();
      return response.data!;
    } on DioException catch (e) {
      log('DioException error: ${e.type} - ${e.message}');
      throw await ErrorHelper.handleDioError(e);
    } on SocketException {
      throw NetworkException(_context.tr.errorNoInternetConnection);
    } catch (e) {
      log('Unexpected error: $e');
      throw AppException(_context.tr.errorUnexpectedError);
    }
  }

  Future<T> uploadToPresignedUrl<T>({required String presignedUrl, required Uint8List fileBytes, required String contentType,}) async {
    try {
      final dio = sl<Dio>();
      dio.interceptors.add(_logger);

      final response = await dio.put<T>(
        presignedUrl,
        data: fileBytes,
        options: Options(
          headers: {'Content-Type': contentType, 'Accept': '*/*',},
          followRedirects: false,
          validateStatus: (status) => status! < 500,
        ),
      );
      return response.data as T;
    } on DioException catch (e) {
      log('DioException error: ${e.type} - ${e.message}');
      throw ErrorHelper.handleDioError(e);
    } on SocketException {
      throw NetworkException(_context.tr.errorNoInternetConnection);
    } catch (e) {
      log('Unexpected error: $e');
      throw AppException(_context.tr.errorUnexpectedError);
    }
  }


  Future<T> get<T>({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken, Options? options}) async {
    return _performRequest<T>(() => getDio(environment).get<T>(url, queryParameters: queryParameters, data: body, options: options), environment: environment, requestToken: requestToken);
  }

  Future<T> post<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).post<T>(url, data: formData ?? body, options: options),environment: environment, requestToken: requestToken);
  }

  Future<T> put<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).put<T>(url, data: formData ?? body, options: options), environment: environment, requestToken: requestToken);
  }

  Future<T> patch<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).patch<T>(url, data: formData ?? body, options: options), environment: environment, requestToken: requestToken);
  }

  Future<T> delete<T>({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).delete<T>(url, queryParameters: queryParameters, data: body), environment: environment, requestToken: requestToken);
  }
}