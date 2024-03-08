import 'package:movies_app/data/clients/tmdb_config.dart';

class TMDBImage {
  static String formatImageUrl({required String path, int size = 500}) {
    return "${TMDBConfig.imageUrl}/w$size$path";
  }
}
