import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/data/api/api_exceptions.dart';
import 'package:movies_app/data/clients/http_client.dart';
import 'package:movies_app/data/api/api_config.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

class MediaClient {
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
      final Response popularMoviesResponse = await _httpClient.get(
        path: ApiConfig.popularMoviesPath,
        parameters: parameters,
      );

      final List<MovieModel> popularMovies =
          (popularMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return popularMovies;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
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
      final Response trendingMoviesResponse = await _httpClient.get(
        path: ApiConfig.trendingMoviesPath,
        parameters: parameters,
      );

      final List<MovieModel> trendingMovies =
          (trendingMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return trendingMovies;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
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
      final Response nowPlayingMoviesResponse = await _httpClient.get(
        path: ApiConfig.nowPlayingMoviesPath,
        parameters: parameters,
      );

      final List<MovieModel> nowPlayingMovies =
          (nowPlayingMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return nowPlayingMovies;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
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
      final Response popularSeriesResponse = await _httpClient.get(
        path: ApiConfig.popularTVSeriesPath,
        parameters: parameters,
      );

      final List<SeriesModel> popularSeries =
          (popularSeriesResponse.data["results"] as List)
              .map((json) => SeriesModel.fromJson(json))
              .toList();
      return popularSeries;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<List<PersonModel>> getPopularActors({
    required String locale,
    required int page,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "page": page.toString(),
      "api_key": _apiKey,
    };
    try {
      final Response popularActorsResponse = await _httpClient.get(
        path: ApiConfig.popularPersonPath,
        parameters: parameters,
      );

      final List<PersonModel> popularActors =
          (popularActorsResponse.data["results"] as List)
              .map((json) => PersonModel.fromJson(json))
              .toList();
      return popularActors;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
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
      final Response modelsResponse = await _httpClient.get(
        path: ApiConfig.searchMediaPath,
        parameters: parameters,
      );

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
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<MovieModel> getMovieDetails({
    required int movieId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response movieDetailsResponse = await _httpClient.get(
        path: "${ApiConfig.moviePath}/$movieId",
        parameters: parameters,
      );

      final MovieModel movieDetails = MovieModel.fromJson(
          movieDetailsResponse.data as Map<String, dynamic>);
      return movieDetails;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<SeriesModel> getSeriesDetails({
    required int seriesId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response seriesDetailsResponse = await _httpClient.get(
        path: "${ApiConfig.seriesPath}/$seriesId",
        parameters: parameters,
      );

      final SeriesModel seriesDetails = SeriesModel.fromJson(
          seriesDetailsResponse.data as Map<String, dynamic>);
      return seriesDetails;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<PersonModel> getPersonDetails({
    required int personId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response personDetailsResponse = await _httpClient.get(
        path: "${ApiConfig.personPath}/$personId",
        parameters: parameters,
      );

      final PersonModel personDetails = PersonModel.fromJson(
          personDetailsResponse.data as Map<String, dynamic>);
      return personDetails;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<List<PersonModel>> getMovieActors({
    required int movieId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response movieActorsResponse = await _httpClient.get(
        path: "${ApiConfig.moviePath}/$movieId/credits",
        parameters: parameters,
      );

      List<PersonModel> movieActors = (movieActorsResponse.data["cast"] as List)
          .map((actorJson) => PersonModel.fromJson(actorJson))
          .toList();
      return movieActors;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<List<PersonModel>> getSeriesActors({
    required int seriesId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response seriesActorsResponse = await _httpClient.get(
        path: "${ApiConfig.seriesPath}/$seriesId/credits",
        parameters: parameters,
      );

      List<PersonModel> seriesActors =
          (seriesActorsResponse.data["cast"] as List)
              .map((actorJson) => PersonModel.fromJson(actorJson))
              .toList();
      return seriesActors;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<AccountModel> getAccountDetails({
    required int accountId,
    required String sessionId,
  }) async {
    Map<String, dynamic> parameters = {
      'session_id': sessionId,
      'api_key': _apiKey,
    };
    try {
      final Response accountDetailsResponse = await _httpClient.get(
        path: "${ApiConfig.accountPath}/$accountId",
        parameters: parameters,
      );

      final AccountModel accountDetails = AccountModel.fromJson(
          accountDetailsResponse.data as Map<String, dynamic>);

      return accountDetails;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<List<MovieModel>> getSimilarMovies({
    required int movieId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response similarMoviesResponse = await _httpClient.get(
        path: "${ApiConfig.moviePath}/$movieId/${ApiConfig.similarPath}",
        parameters: parameters,
      );

      List<MovieModel> similarMovies =
          (similarMoviesResponse.data["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
      return similarMovies;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }

  Future<List<SeriesModel>> getSimilarSeries({
    required int seriesId,
    required String locale,
  }) async {
    Map<String, dynamic> parameters = {
      "language": locale,
      "api_key": _apiKey,
    };
    try {
      final Response similarSeriesResponse = await _httpClient.get(
        path: "${ApiConfig.seriesPath}/$seriesId/${ApiConfig.similarPath}",
        parameters: parameters,
      );

      List<SeriesModel> similarSeries =
          (similarSeriesResponse.data["results"] as List)
              .map((json) => SeriesModel.fromJson(json))
              .toList();
      return similarSeries;
    } on ApiException {
      rethrow;
    } catch (err) {
      throw ApiException(type: ApiExceptionType.unknown);
    }
  }
}
