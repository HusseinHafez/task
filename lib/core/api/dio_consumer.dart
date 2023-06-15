import 'dart:convert';
import 'dart:io';
//import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import '../utils/service_locator.dart';
import 'api_helper.dart';
import 'dio_interceptor.dart';
import 'end_poits.dart';
import 'exceptions.dart';
import 'status_code.dart';

class DioConsumer implements ApiHelper {
  Dio client;
  DioConsumer({required this.client}) {
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
      final  dio=HttpClient(context:SecurityContext(withTrustedRoots: false));
        dio.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
        return dio;
      },
    );

    
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;

    client.interceptors.add(getIt<DioInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(getIt<LogInterceptor>());
    }
  }

  @override
  Future postData(
      {required String url,
      required Map<String, dynamic> data,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(url,
          data: formDataIsEnabled ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return handleDioException(error);
    }
  }

  @override
  Future getData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(url, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return handleDioException(error);
    }
  }

  @override
  Future putData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(url, data: data, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return handleDioException(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badCertificate:
        throw const BadCertificateException();
      case DioExceptionType.badResponse:
        throw const BadResponseException();
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException();
      case DioExceptionType.unknown:
        throw NoInternetConnectionException();
    }
    
  }

  @override
  Future deleteData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(url);
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      return handleDioException(error);
    }
  }
}