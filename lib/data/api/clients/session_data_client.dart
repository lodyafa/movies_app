import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataClient {
  late final FlutterSecureStorage _secureStorage;

  static const _sessionIdKey = "session_id";
  static const _accountIdKey = "account_id";

  SessionDataClient({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  Future<String?> getSessionId() async {
    final String? sessionId = await _secureStorage.read(key: _sessionIdKey);
    return sessionId;
  }

  Future<int?> getAccountId() async {
    final String? accoutId = await _secureStorage.read(key: _accountIdKey);
    return accoutId != null ? int.tryParse(accoutId) : null;
  }

  Future<void> setSessionId({required String sessionId}) async {
    await _secureStorage.write(key: _sessionIdKey, value: sessionId);
  }

  Future<void> setAccountId({required int accountId}) async {
    await _secureStorage.write(key: _accountIdKey, value: accountId.toString());
  }

  Future<void> deleteSessionId() async {
    await _secureStorage.delete(key: _sessionIdKey);
  }

  Future<void> deleteAccountId() async {
    await _secureStorage.delete(key: _sessionIdKey);
  }
}
