import 'package:dio/dio.dart';
import 'package:movies_app/data/clients/tmdb_config.dart';

class AppHttpClient {
  static final _dio = Dio();

  Uri _createUri({
    required String path,
    Map<String, dynamic>? parameters,
  }) {
    final uri = Uri.parse('${TMDBConfig.baseUrl}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<Response?> get({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    final Uri uri = _createUri(path: path, parameters: parameters);
    try {
      final Response response = await _dio.getUri(uri);
      if (response.data == null) {
        return null;
      }
      return response;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<Response?> post({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    final Uri uri = _createUri(path: path, parameters: parameters);
    try {
      final Response response = await _dio.postUri(uri);
      if (response.data == null) {
        return null;
      }
      return response;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
