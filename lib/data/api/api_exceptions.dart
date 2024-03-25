
enum 
ApiExceptionType { network, auth, sessionExpired, unknown }

class ApiException {
  final ApiExceptionType type;

  ApiException({required this.type});
}
