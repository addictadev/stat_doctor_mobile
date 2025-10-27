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

  Future<T> _performRequest<T>(Future<Response<T>> Function() request, {required ApiEnvironment environment,}) async {
    try {
      final dio = getDio(environment);
      String? token = sl<Storage>().getToken();
      if(token != null) {dio.options.headers['doctor-app-token'] = token;}
      final response = await request();
      await _checkToken(response);
      _chckData(response);
      return response.data!;
    } on DioException catch (e) {
      log('DioException error: ${e.type} - ${e.message}');
      throw await ErrorHelper.handleDioError(e);
    } on ValidationException {
      rethrow;
    } on SocketException {
      throw NetworkException(_context.tr.errorNoInternetConnection);
    } catch (e) {
      log('Unexpected error: $e');
      throw AppException(_context.tr.errorUnexpectedError);
    }
  }

  Future<void> _checkToken(Response response) async {
    final responseHeaders = response.headers;
    final responseToken = responseHeaders.value('doctor-app-token');
    if(responseToken != null) {await sl<Storage>().storeToken(token: responseToken);}
  }

  void _chckData(Response response) {
    final responseData = response.data as Map<String, dynamic>?;
    if(responseData?['data'] == null) {
      throw ValidationException(responseData?['message'] ?? _context.tr.errorUnexpectedError);
    }
  }

  Future<T> get<T>({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken, Options? options}) async {
    return _performRequest<T>(() => getDio(environment).get<T>(url, queryParameters: queryParameters, data: body, options: options), environment: environment);
  }

  Future<T> post<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).post<T>(url, data: formData ?? body, options: options),environment: environment);
  }

  Future<T> put<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).put<T>(url, data: formData ?? body, options: options), environment: environment);
  }

  Future<T> patch<T>({required String url, Map<String, dynamic>? body, FormData? formData, Options? options, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).patch<T>(url, data: formData ?? body, options: options), environment: environment);
  }

  Future<T> delete<T>({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, ApiEnvironment environment = ApiEnvironment.primary, String? requestToken}) async {
    return _performRequest<T>(() => getDio(environment).delete<T>(url, queryParameters: queryParameters, data: body), environment: environment);
  }
}