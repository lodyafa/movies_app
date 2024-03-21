import 'package:movies_app/data/api/api_config.dart';

class ApiImageFormatter {
  static String formatImageUrl({required String path, int size = 500}) {
    return "${ApiConfig.imageUrl}/w$size$path";
  }
}
