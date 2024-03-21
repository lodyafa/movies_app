import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movies_app/data/api/api_config.dart';
import 'package:movies_app/data/api/api_exceptions.dart';

class AppHttpClient {
  static final _dio = Dio();

  Uri _createUri({
    required String path,
    Map<String, dynamic>? parameters,
  }) {
    final uri = Uri.parse('${ApiConfig.baseUrl}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    final uri = _createUri(path: path, parameters: parameters);
    try {
      Response response = await _dio.getUri(
        uri,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      return response;
    } on DioException catch (err, stackStrace) {
      if (err.error is SocketException) {
        Error.throwWithStackTrace(
          ApiException(type: ApiExceptionType.network),
          stackStrace,
        );
      } else {
        _validateResponse(response: err.response!);
        Error.throwWithStackTrace(
          ApiException(type: ApiExceptionType.network),
          stackStrace,
        );
      }
    } on ApiException {
      rethrow;
    } catch (err, stackStrace) {
      Error.throwWithStackTrace(
        ApiException(type: ApiExceptionType.network),
        stackStrace,
      );
    }
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    final Uri uri = _createUri(path: path, parameters: parameters);
    try {
      final Response response = await _dio.postUri(uri);
      return response;
    } on DioException catch (err, stackStrace) {
      if (err.error is SocketException) {
        Error.throwWithStackTrace(
          ApiException(type: ApiExceptionType.network),
          stackStrace,
        );
      } else {
        _validateResponse(response: err.response!);
        Error.throwWithStackTrace(
          ApiException(type: ApiExceptionType.network),
          stackStrace,
        );
      }
    } on ApiException {
      rethrow;
    } catch (err, stackStrace) {
      Error.throwWithStackTrace(
        ApiException(type: ApiExceptionType.network),
        stackStrace,
      );
    }
  }

  void _validateResponse({required Response response}) {
    if (response.statusCode == 401) {
      final dynamic status = response.data['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiException(type: ApiExceptionType.auth);
      } else if (code == 3) {
        throw ApiException(type: ApiExceptionType.sessionExpired);
      } else {
        throw ApiException(type: ApiExceptionType.unknown);
      }
    }
  }
}
