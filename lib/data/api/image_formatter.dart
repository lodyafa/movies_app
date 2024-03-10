import 'package:movies_app/data/api/api_config.dart';

class TMDBImage {
  static String formatImageUrl({required String path, int size = 500}) {
    return "${ApiConfig.imageUrl}/w$size$path";
  }
}
