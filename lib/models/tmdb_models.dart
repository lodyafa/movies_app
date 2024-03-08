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
  final String? status;
  final String? tagline;
  final String? title;
  final dynamic voteAverage;
  final int? voteCount;

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
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
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
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }
}

class SeriesModel extends TMDBModel {
  final int? id;
  final bool? adult;
  final String? backdropPath;
  // final List<int>? genreIds;
  // final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final dynamic voteAverage;
  final int? voteCount;

  SeriesModel({
    this.id,
    this.adult,
    this.backdropPath,
    // this.genreIds,
    // this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // genreIds: json['genre_ids'],
      id: json['id'],
      // originCountry: json['origin_country'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class PersonModel extends TMDBModel {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? profilePath;
  String? mediaType;
  // List<int>? genredynamic
  dynamic popularity;
  String? firstAirDate;
  dynamic voteAverage;
  dynamic voteCount;
  // List<String>? originCountry;
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;

  PersonModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.profilePath,
      this.mediaType,
      // this.genreIds,
      this.popularity,
      this.firstAirDate,
      this.voteAverage,
      this.voteCount,
      // this.originCountry,
      this.title,
      this.originalTitle,
      this.releaseDate,
      this.video});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      profilePath: json['profile_path'],
      mediaType: json['media_type'],
      // genreIds = json['genre_ids'].cast<int>();
      popularity: json['popularity'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      // originCountry: json['origin_country'].cast<String>(),
      title: json['title'],
      originalTitle: json['original_title'],
      releaseDate: json['release_date'],
      video: json['video'],
    );
  }
}
