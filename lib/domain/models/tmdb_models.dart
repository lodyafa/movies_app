abstract class TMDBModel {}

class MovieModel extends TMDBModel {
  final bool? adult;
  final int? id;
  final String? backdropPath;
  final dynamic budget;
  final String? homepage;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final String? releaseDate;
  final dynamic revenue;
  final dynamic runtime;
  final String? title;
  final dynamic voteAverage;
  final int? voteCount;
  final List<dynamic>? genreIds;
  final List<Genre>? genres;
  final List<ProductionCountry>? productionCountries;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.homepage,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.title,
    this.genreIds,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.productionCountries,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    List<Genre> genres = json["genres"] == null
        ? []
        : Genre.fromJsonGenresList(json["genres"] as List<dynamic>);

    List<ProductionCountry> productionCountries =
        json["production_countries"] == null
            ? []
            : ProductionCountry.fromJsonProdCountriesList(
                json["production_countries"] as List<dynamic>);

    return MovieModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      budget: json["budget"],
      homepage: json["homepage"],
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      revenue: json["revenue"],
      runtime: json["runtime"],
      title: json["title"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      genreIds: json["genre_ids"],
      genres: genres,
      productionCountries: productionCountries,
    );
  }
}

class SeriesModel extends TMDBModel {
  final int? id;
  final bool? adult;
  final String? backdropPath;
  final List<dynamic>? genreIds;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final dynamic voteAverage;
  final dynamic voteCount;
  final dynamic episodeRunTime;
  final List<dynamic>? languages;
  final String? lastAirDate;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final bool? inProduction;
  final String? homepage;
  final String? status;
  final String? tagline;
  final String? type;
  final List<Genre>? genres;

  SeriesModel({
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.episodeRunTime,
    this.genreIds,
    this.type,
    this.tagline,
    this.status,
    this.numberOfSeasons,
    this.numberOfEpisodes,
    this.lastAirDate,
    this.homepage,
    this.inProduction,
    this.languages,
    this.genres,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    List<Genre> genres = json["genres"] == null
        ? []
        : Genre.fromJsonGenresList(json["genres"] as List<dynamic>);

    return SeriesModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      episodeRunTime: json["episode_run_time"],
      type: json["type"],
      tagline: json["tag_line"],
      status: json["status"],
      numberOfSeasons: json["number_of_seasons"],
      numberOfEpisodes: json["number_of_episodes"],
      homepage: json["homepage"] ?? "None",
      inProduction: json["in_production"],
      languages: json["languages"],
      lastAirDate: json["last_air_date"] ?? "None",
      genres: genres,
    );
  }
}

class PersonModel extends TMDBModel {
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final String? profilePath;
  final String? mediaType;
  final dynamic popularity;
  final String? title;
  final String? originalTitle;
  final String? releaseDate;
  final String? birthday;
  final dynamic gender;
  final String? placeOfBirth;
  final String? biography;
  final String? posterPath;

  PersonModel({
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.profilePath,
    this.mediaType,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.birthday,
    this.popularity,
    this.gender,
    this.placeOfBirth,
    this.biography,
    this.posterPath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      profilePath: json['profile_path'],
      mediaType: json['media_type'],
      title: json['title'],
      originalTitle: json['original_title'],
      releaseDate: json['release_date'],
      gender: json["gender"],
      placeOfBirth: json['place_of_birth'],
      popularity: json["popularity"],
      birthday: json['birthday'],
      biography: json["biography"],
      posterPath: json['poster_path'],
    );
  }
}

class Genre {
  final dynamic id;
  final String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJSON(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<Genre> fromJsonGenresList(List<dynamic> genresList) {
    List<Genre> resultList = [];
    for (Map<String, dynamic> json in genresList) {
      resultList.add(Genre.fromJSON(json));
    }
    return resultList;
  }
}

class ProductionCountry {
  final String? iso_3166_1;
  final String? name;

  ProductionCountry({
    this.iso_3166_1,
    this.name,
  });

  factory ProductionCountry.fromJSON(Map<String, dynamic> json) {
    return ProductionCountry(
      iso_3166_1: json["iso_3166_1"],
      name: json["name"],
    );
  }

  static List<ProductionCountry> fromJsonProdCountriesList(
      List<dynamic> countriesList) {
    List<ProductionCountry> resultList = [];
    for (Map<String, dynamic> json in countriesList) {
      resultList.add(ProductionCountry.fromJSON(json));
    }
    return resultList;
  }
}
