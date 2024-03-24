import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/data/clients/http_client.dart';
import 'package:movies_app/data/api/api_config.dart';

class AuthClient {
  static final _httpClient = AppHttpClient();
  static final _apiKey = dotenv.get("API_KEY");

  Future<String> auth({
    required String login,
    required String password,
  }) async {
    final String requestToken = await _getToken();

    final String validatedToken = await _validateUser(
      login: login,
      password: password,
      requestToken: requestToken,
    );

    final String sessionId =
        await _getSessionId(validatedToken: validatedToken);

    return sessionId;
  }

  Future<String> _getToken() async {
    Map<String, dynamic> parameters = {
      'api_key': _apiKey,
    };

    final tokenResponse = await _httpClient.get(
      path: ApiConfig.newTokenPath,
      parameters: parameters,
    );

    final String token = tokenResponse.data["request_token"] as String;
    return token;
  }

  Future<String> _validateUser({
    required String login,
    required String password,
    required String requestToken,
  }) async {
    Map<String, dynamic> parameters = {
      'username': login,
      'password': password,
      'request_token': requestToken,
      'api_key': _apiKey,
    };

    final validateResponse = await _httpClient.post(
      path: ApiConfig.validateWithLoginPath,
      parameters: parameters,
    );

    final String validToken = validateResponse.data["request_token"] as String;
    return validToken;
  }

  Future<String> _getSessionId({
    required String validatedToken,
  }) async {
    Map<String, dynamic> parameters = <String, dynamic>{
      'request_token': validatedToken,
      'api_key': _apiKey,
    };

    final sessionResponse = await _httpClient.post(
      path: ApiConfig.newSessionPath,
      parameters: parameters,
    );

    final String sessionId = sessionResponse.data["session_id"] as String;
    return sessionId;
  }
}
