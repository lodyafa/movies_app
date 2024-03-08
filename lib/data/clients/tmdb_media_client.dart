import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/data/clients/http_client.dart';
import 'package:movies_app/data/clients/tmdb_config.dart';
import 'package:movies_app/models/tmdb_models.dart';

class TMDBMediaClient {
  static final _httpClient = AppHttpClient();
  static final _apiKey = dotenv.get("API_KEY");

  Future<List<MovieModel>> getPopularMovies({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response? popularMoviesResponse = await _httpClient.get(
        path: TMDBConfig.popularMoviesPath,
        parameters: parameters,
      );

      if (popularMoviesResponse == null || popularMoviesResponse.data == null) {
        return const [];
      }

      final List<MovieModel> popularMovies =
          (popularMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return popularMovies;
    } catch (err) {
      print(err);
      return const [];
    }
  }

  Future<List<MovieModel>> getTrendingMovies({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response? trendingMoviesResponse = await _httpClient.get(
        path: TMDBConfig.trendingMoviesPath,
        parameters: parameters,
      );

      if (trendingMoviesResponse == null ||
          trendingMoviesResponse.data == null) {
        return const [];
      }

      final List<MovieModel> trendingMovies =
          (trendingMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return trendingMovies;
    } catch (err) {
      print(err);
      return const [];
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response? nowPlayingMoviesResponse = await _httpClient.get(
        path: TMDBConfig.nowPlayingMoviesPath,
        parameters: parameters,
      );

      if (nowPlayingMoviesResponse == null ||
          nowPlayingMoviesResponse.data == null) {
        return const [];
      }

      final List<MovieModel> nowPlayingMovies =
          (nowPlayingMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return nowPlayingMovies;
    } catch (err) {
      print(err);
      return const [];
    }
  }

  Future<List<SeriesModel>> getPopularSeries({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response? popularSeriesResponse = await _httpClient.get(
        path: TMDBConfig.popularTVSeriesPath,
        parameters: parameters,
      );

      if (popularSeriesResponse == null || popularSeriesResponse.data == null) {
        return const [];
      }

      final List<SeriesModel> popularSeries =
          (popularSeriesResponse.data["results"] as List)
              .map((json) => SeriesModel.fromJson(json))
              .toList();
      return popularSeries;
    } catch (err) {
      print(err);
      return const [];
    }
  }

  Future<List<PersonModel>> getPopularPeople({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response? popularPeopleResponse = await _httpClient.get(
        path: TMDBConfig.popularPersonPath,
        parameters: parameters,
      );

      if (popularPeopleResponse == null || popularPeopleResponse.data == null) {
        return const [];
      }

      final List<PersonModel> popularPeople =
          (popularPeopleResponse.data["results"] as List)
              .map((json) => PersonModel.fromJson(json))
              .toList();
      return popularPeople;
    } catch (err) {
      print(err);
      return const [];
    }
  }

  Future<List<TMDBModel>> getSearchMedia({
    required String locale,
    required int page,
    required String query,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "query": query,
      "api_key": _apiKey,
    };
    try {
      final Response? modelsResponse = await _httpClient.get(
        path: TMDBConfig.searchMediaPath,
        parameters: parameters,
      );

      if (modelsResponse == null || modelsResponse.data == null) {
        return const [];
      }

      final List<TMDBModel> models =
          (modelsResponse.data["results"] as List).map((json) {
        if (json["media_type"] == "movie") {
          return MovieModel.fromJson(json);
        } else if (json["media_type"] == "tv") {
          return SeriesModel.fromJson(json);
        } else {
          return PersonModel.fromJson(json);
        }
      }).toList();
      return models;
    } catch (err) {
      print(err);
      return const [];
    }
  }
}
