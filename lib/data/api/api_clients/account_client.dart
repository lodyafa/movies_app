import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/data/clients/http_client.dart';
import 'package:movies_app/data/api/api_config.dart';

class AccountClient {
  static final _httpClient = AppHttpClient();
  static final _apiKey = dotenv.get("API_KEY");

  Future<int> getAccountId({required String sessionId}) async {
    Map<String, dynamic> parameters = {
      'session_id': sessionId,
      'api_key': _apiKey,
    };

    final response = await _httpClient.get(
      path: ApiConfig.accountPath,
      parameters: parameters,
    );
      
    return response.data["id"] as int;
  }
}
